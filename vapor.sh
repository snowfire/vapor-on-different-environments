#!/usr/bin/env bash

if [[ $1 == "staging" ]]
then
    echo "Use vapor.staging.yml"
elif [[ $1 == "production" ]]
then
    echo "Use vapor.production.yml"
else
    echo "Invalid environment, please specify staging or production"
    exit
fi

VAPORFILE=vapor.yml

if test -f "$VAPORFILE"; then
    echo "$VAPORFILE exist, we are not allowed to run the vapor script"
    exit
fi

ENVIRONMENTFILE="vapor.$1.yml"

# Move the file to a temporary "vapor.yml" which the vapor bin can use
cp $ENVIRONMENTFILE $VAPORFILE

# Forward all arguments except the first one to the vapor binary
vendor/bin/vapor ${@:2}

rm $VAPORFILE