#!/bin/bash -u

# Hacky script to do once-off backups of remote hosts as the root user using
# rsync

RBACKUP_DIR=/Volumes/Offload/RBackups
NEW_RBACKUP=$RBACKUP_DIR/$1_`date "+%Y%m%d%H%S"`
RSYNC_ARGS="-rlptgoz --delete --numeric-ids -H -A -X --fake-super"
RSYNC_EXCLUDES="--exclude=/dev --exclude=/sys --exclude=/proc"

rsync -v $RSYNC_ARGS $RSYNC_EXCLUDES -e ssh root@$1:/ $NEW_RBACKUP/
