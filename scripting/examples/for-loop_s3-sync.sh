#!/bin/bash

exec >> /var/log/db_backup_logs/s3_old_backup_deletion.log 2>&1

### The whole perpose is to delete the older backup files available from the s3 buckets and save as many amount

printf '%s %s\n' "$(date)" "---> syncing the backup files to buckets and removing the old files from it."

dbname="platform porte map gwc"

for database in $dbname
do

  { backup_count=$(find /data/db-backup-daily/"$database" -maxdepth 1 -type f | wc -l) ; [[ $backup_count -ge 3 ]] && \
    { /usr/local/bin/s3cmd sync -r --delete-removed /data/db-backup-daily/"$database"/ s3://rt-"$database"-db ; \
  echo -e "$(date)---> syncing $database backups.\n-------------------------------"; } } || \
  echo -e "not enough $database backups to be synced to s3 !!\n-------------------------------"

done

printf '%s %s\n' "$(date)" "---> done."

echo -e "*******************************************************************************\n"
