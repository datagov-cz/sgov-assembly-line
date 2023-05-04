#!/bin/bash

# Helper script to send messages to slack channel.

# Webhook to slack channel typically starting with https://hooks.slack.com/services/
WEBHOOK=
CTX=PROD
MESSAGE=$1
ICON=$2

curl -X POST --data-urlencode "payload={\"channel\": \"#monitorování-výrobní-linky\", \"username\": \"[$CTX] Nasazení výrobní linky\", \"text\": \"$MESSAGE\", \"icon_emoji\": \"$ICON\"}" $WEBHOOK
