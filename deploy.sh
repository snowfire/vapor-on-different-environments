#!/usr/bin/env bash

if [[ $1 == "staging" ]]
then
    echo "Deploying to Staging"
elif [[ $1 == "production" ]]
then
    echo "Deploying to Production"
else
    echo "Invalid environment, please specify staging or production"
    exit
fi

VAPORFILE=vapor.yml

if test -f "$VAPORFILE"; then
    echo "$VAPORFILE exist, we are not allowed to run the deploy script"
    exit
fi

ENVIRONMENTFILE="vapor.$1.yml"

# Move the file to a temporary "vapor.yml" which the vapor bin can use
cp $ENVIRONMENTFILE $VAPORFILE

vendor/bin/vapor deploy $1

rm $VAPORFILE