#!/bin/sh
# get token
# curl -k https://api.starter-us-east-1.openshift.com/oauth/token/request


# ENVIRONMENT VARIABLS
GITHUB_REPOSITORY=akubicharm
GITHUB_REF=master
#GITHUB_REPOSITORY=osevg
#GITHUB_REF=master

PROJECT=workshopper


cat << EOL > workshopper.env 
CONTENT_URL_PREFIX=https://raw.githubusercontent.com/$GITHUB_REPOSITORY/workshopper-content/$GITHUB_REF

WORKSHOPS_URLS=https://raw.githubusercontent.com/$GITHUB_REPOSITORY/workshopper-content/$GITHUB_REF/_workshops/demo-cicd-eap.yml

#WORKSHOPS_URLS=https://raw.githubusercontent.com/$GITHUB_REPOSITORY/workshopper-workshops/$GITHUB_REF/roadshow.yml
EOL


oc new-project $PROJECT
oc project $PROJECT
oc delete all --all
oc new-app osevg/workshopper  --env-file=./workshopper.env
