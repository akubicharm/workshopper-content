#!/bin/sh
# get token
# curl -k https://api.starter-us-east-1.openshift.com/oauth/token/request


# ENVIRONMENT VARIABLS
GITHUB_REPOSITORY=akubicharm
GITHUB_REF=japanese_short
#GITHUB_REPOSITORY=osevg
#GITHUB_REF=master


cat << EOL > workshopper.env 
CONTENT_URL_PREFIX=https://raw.githubusercontent.com/$GITHUB_REPOSITORY/workshopper-content/$GITHUB_REF
WORKSHOPS_URLS=https://raw.githubusercontent.com/$GITHUB_REPOSITORY/workshopper-workshops/$GITHUB_REF/roadshow.yml
EOL


oc new-project komizows
oc project komizows
oc delete all --all
oc new-app osevg/workshopper  --env-file=./workshopper.env
