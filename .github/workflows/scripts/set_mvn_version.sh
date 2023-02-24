#!/bin/bash

echo 'Will change the version in pom.xml files...'

# check if the checkout was to checkout a branch
if [ $3 != '1' ]
    then echo 'git checkout did not checkout a branch - quitting';exit
fi

# get current branch name
branch=$(git rev-parse --abbrev-ref HEAD)

# get current version of the top level pom
current_version=$(mvn help:evaluate -Dexpression=project.version | grep -v '\[.*')

# extract version suffix
suffix=$(echo $current_version | cut -d \- -f 2)

# build new version
version=$branch-$suffix

# run maven versions plugin to set new version
mvn versions:set -DgenerateBackupPoms=false -DnewVersion=$version
#mvn -Drevision=$branch-SNAPSHOT

echo 'Changed version in pom.xml files to $version'
