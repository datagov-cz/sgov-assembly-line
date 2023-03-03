#!/bin/bash

# This shell script is used to create a user that can be used to access Keycloak's Admin API for the CheckIt Server application and start Keycloak afterwards.

/opt/jboss/keycloak/bin/add-user-keycloak.sh -r $REALM_ID -u $KEYCLOAK_API_USER_USERNAME -p $KEYCLOAK_API_USER_PASSWORD

# Set roles to allow API access

echo "Configuring roles for Admin API user: $KEYCLOAK_API_USER_USERNAME"

changelog_filepath="/tmp/changelog.txt"
keycloak_add_user_filepath="/opt/jboss/keycloak/standalone/configuration/keycloak-add-user.json"
search_roles="\"realm-management\".*\s*"
replace_roles=$(cat /al-auth-server/api-roles.txt)

sed -i "s/$search_roles/$replace_roles/w $changelog_filepath" $keycloak_add_user_filepath

echo -n "Configuring roles for Admin API user: $KEYCLOAK_API_USER_USERNAME"
if [ -s $changelog_filepath ]; then
    echo " - Done"
    rm $changelog_filepath
else
    echo " - Failed"
    exit 1
fi

# Start Keycloak

/opt/jboss/tools/docker-entrypoint.sh

