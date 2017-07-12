#!/bin/sh
#oc login https://komizo-openshift34.japanwest.cloudapp.azure.com:8443/ -u joe -p redhat


# ENVIRONMENT VARIABLS
GITHUB_REPOSITORY=akubicharm
GITHUB_REF=japanese_short
#GITHUB_REPOSITORY=osevg
#GITHUB_REF=master


cat << EOL > workshopper.env 
CONTENT_URL_PREFIX=https://raw.githubusercontent.com/$GITHUB_REPOSITORY/workshopper-content/$GITHUB_REF
WORKSHOPS_URLS=https://raw.githubusercontent.com/$GITHUB_REPOSITORY/workshopper-workshops/$GITHUB_REF/roadshow.yml
EOL


#oc new-project workshop
oc project workshop
oc delete all --all
oc new-app osevg/workshopper -n workshop --env-file=./workshopper.env
