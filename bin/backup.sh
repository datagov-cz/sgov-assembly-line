#!/bin/bash

# Helper script to backup docker volumes. It allows to set up automatic cleanup of backups (picks up backups to remove randomly).

#####################
### CONFIGURATION ###
#####################

# directory where backups are created
BACKUPS_ROOT_DIR=/backup/docker-volumes

# automatic cleanup is triggered only if at least MIN_BACKUPS_COUNT backups are available
MIN_BACKUPS_COUNT=10

# automatic cleanup is triggered only if more than MAXIMAL_BACKUP_STORAGE_SIZE_IN_GB space is taken
MAXIMAL_BACKUP_STORAGE_SIZE_IN_GB=35

##########################
### REMOVE OLD BACKUPS ###
##########################

BACKUP_STORAGE_SIZE="`du -BG -s $BACKUPS_ROOT_DIR | sed 's/G.*//' 2>/dev/null`" 
BACKUPS_COUNT="`ls  $BACKUPS_ROOT_DIR/*.tar.gz | wc -l 2>/dev/null`"

if [ "$BACKUPS_COUNT" -gt "$MIN_BACKUPS_COUNT" ]; then
  if [  "$BACKUP_STORAGE_SIZE" -gt  "$MAXIMAL_BACKUP_STORAGE_SIZE_IN_GB" ]; then
	
	# pick random 2 files beside MIN_BACKUPS_COUNT newest
	FILES_TO_REMOVE="`ls -t $BACKUPS_ROOT_DIR/[0-9]*.tar.gz | tail +$( expr $MIN_BACKUPS_COUNT + 1 ) | shuf -n 2`"
	echo INFO: Removing files $FILES_TO_REMOVE
	rm $FILES_TO_REMOVE
  fi
fi

##########################
### CREATE NEW BACKUPS ###
##########################

FILE=$(date +'%Y%m%d').tar.gz
tar -zcvf $FILE /var/lib/docker/volumes
mv $FILE $BACKUPS_ROOT_DIR

