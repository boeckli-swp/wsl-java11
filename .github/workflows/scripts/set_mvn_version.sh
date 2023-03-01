#!/bin/bash

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

echo "### Changed version in pom.xml files $NEW_MAVEN_VERSION"
