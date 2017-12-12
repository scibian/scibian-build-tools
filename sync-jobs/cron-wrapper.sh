#!/bin/sh

LOG=/local00/sync/sync-jobs_$(date +'%Y-%m-%d_%H:%M:%S').txt
# run utility
/usr/local/sbin/scibian-sync-jobs &> $LOG
# remove old log files
echo -e "\nremoving old log files:" >> $LOG
find /local00/sync -mtime +2  -print -delete &>> $LOG
