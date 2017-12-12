#!/bin/sh

LOG=/local00/sync/sync-jobs_$(date +'%Y-%m-%d_%H:%M:%S').txt
echo "Run: $(date)" > $LOG
# run utility
/usr/local/sbin/scibian-sync-jobs &>> $LOG
# remove old log files
echo -e "\nremoving old log files:" >> $LOG
find /local00/sync -mtime +2  -print -delete &>> $LOG
ln -sf $LOG /local00/sync/latest.txt
