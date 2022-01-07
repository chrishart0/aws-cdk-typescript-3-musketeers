#!/bin/bash
echo "Node Version: $(node --version)"
echo "NPM Version: $(npm --version)"
echo "CDK Version: $(cdk --version)"

BASEDIR="$1"

echo "Basedir => ${BASEDIR}"

########################################################
# Handle for purposes other than local-test environment#
########################################################

#If this is just a synth then simply throw the synth to the console and exit the container
echo "PURPOSE:" $PURPOSE

if [ $PURPOSE = "synth" ]; then
    cdk synth --no-staging 
    exit
fi

if [ $PURPOSE = "local-cdk-deploy" ]; then
    cdk deploy --require-approval never
    exit
fi