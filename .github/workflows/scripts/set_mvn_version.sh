#!/bin/bash

echo 'Will change the version in pom.xml files...'

# check if the checkout was to checkout a branch
if [ $3 != '1' ]
    then echo 'git checkout did not checkout a branch - quitting';exit
fi

# get current branch name
branch=$(git rev-parse --abbrev-ref HEAD)
echo "### Branch is $branch"

# get current version of the top level pom
MVN_VERSION=$( mvn help:evaluate -Dexpression=project.version -q -DforceStdout )
echo "GUGUS=MVN_VERSION" >> "$GITHUB_OUTPUT"
echo "### Current version is: $MVN_VERSION"

# extract version suffix
suffix=$(echo $MVN_VERSION | cut -d \- -f 2)
echo "### Suffix is: $suffix"

# build new version
BRANCH_MAVEN_VERSION=$branch-$suffix

# run maven versions plugin to set new version
mvn versions:set -DgenerateBackupPoms=false -DnewVersion=BRANCH_MAVEN_VERSION
#mvn -Drevision=$branch-SNAPSHOT

echo "### Changed version in pom.xml files to $BRANCH_MAVEN_VERSION"
