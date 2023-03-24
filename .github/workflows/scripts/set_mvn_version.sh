#!/bin/bash
# Here we figure out what version the build will have.
# If we are on the master, then version will remain as it is
# If we are on a feature branch (or non master branch) then we need to change the maven version to avoid that artefact gets overwritten and to be able to 
# add a dependency to a feature branch artifact-
# The rule is the following:
# master branch:  use version specified in pom.xml
# feature branch: the feature branch name will be prepended to the maven version. Slash in feature branch name is replaced with a underscore
# Example: 
#
# Given
# feature branch name: feature/DEVA-1234
# version in pom.xml:  1.0.0-SNAPSHOT     
# Result
# version calculated:  feature_DEVA-1234-1.0.0-SNAPSHOT   
#
# Output of this script are written into GITHUB_OUTPUT area:
# variable: GIT_BRANCH
# variable: ORIGINAL_MVN_VERSION
# variable: BRANCH_MVN_VERSION
# Those variable can be used later in other steps or jobs

echo 'Will change the version in pom.xml files...'
# check if the checkout was to checkout a branch
if [ $3 != '1' ]
    then echo 'git checkout did not checkout a branch - quitting';exit
fi

# get current branch name
branch=$(git rev-parse --abbrev-ref HEAD)
echo "GIT_BRANCH=$branch" >> "$GITHUB_OUTPUT"
echo "### Branch is $branch"
branch=${branch//[\/]/_}
echo "### Branch is $branch"

# get current version of the top level pom
MVN_VERSION=$( mvn help:evaluate -Dexpression=project.version -q -DforceStdout )
echo "ORIGINAL_MVN_VERSION=$MVN_VERSION" >> "$GITHUB_OUTPUT"
echo "### Current version is: $MVN_VERSION"

# extract version suffix
suffix=$(echo $MVN_VERSION | cut -d \- -f 2)
echo "### Suffix is: $suffix"

prefix=$(echo $MVN_VERSION | cut -d \- -f 1)
echo "### Prefix is: $prefix"

# build new version
if [[ "$branch" != "master" ]] 
then
    NEW_MAVEN_VERSION=${branch}_$prefix-$suffix
else
    NEW_MAVEN_VERSION=$MVN_VERSION
fi
echo "BRANCH_MVN_VERSION=$NEW_MAVEN_VERSION" >> "$GITHUB_OUTPUT"

echo "### Changed version from -$MVN_VERSION- in pom.xml files to -$NEW_MAVEN_VERSION-"
