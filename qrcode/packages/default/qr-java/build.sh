#!/bin/sh

set -e 

# set to 'mave' to use maven
# set to 'gradle' to use gradle
BUILD="maven"

if [ $BUILD == "maven" ]; then
    mvn install
    echo target/qr-1.0.0-jar-with-dependencies.jar > .include
else
    if [ $BUILD == "gradle" ]; then
        gradlew jar
        echo build/libs/qr-java-1.0.jar > .include
    else
        echo unknown builder
        exit -1
    fi
fi
