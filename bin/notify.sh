#!/bin/bash

# Helper script to send messages to slack channel.

#################
# CONFIGURATION #
#################

# webhook to slack channel typically starting with https://hooks.slack.com/services/
WEBHOOK=

# context of assembly line e.g. PROD/DEV
CTX=PROD

########
# MAIN #
########

MESSAGE=$1
ICON=$2

curl -X POST --data-urlencode "payload={\"channel\": \"#monitorování-výrobní-linky\", \"username\": \"[$CTX] Nasazení výrobní linky\", \"text\": \"$MESSAGE\", \"icon_emoji\": \"$ICON\"}" $WEBHOOK
