# matin db backup script
```
#!/bin/bash

# platform(178.36) / map , gwc(178.38) / porte(178.39)

dbname=$1         #the first and only arg as the db name.

today_date=$(date +"%Y_%m_%d_%I_%M")

LOGFILE=/var/log/db_backup_logs/db_backup.log

username=support

porte_host=192.168.178.39                         # host ip address which the postgres database is on
gwc_host=192.168.178.38
map_host=192.168.178.38
platform_host=192.168.178.36

case $dbname in
  porte)
    (
    printf '%s %s\n' "$(date)" "---> Create full backup from $dbname "
    ssh -o StrictHostKeyChecking=no "$username"@"$porte_host" pg_dump --file /data/backups/"$dbname"/"$dbname"_db_"${today_date}".sql --host "127.0.0.1" \
    --port "5432" --username "postgres" --no-password --role "postgres" --format=c --blobs --encoding "UTF8" "$dbname"    

    echo -e "$?" > /var/log/db_backup_logs/porte_backup_exit_code.log
    
    printf '%s\n' "---> Copy file to /data/db-backup-daily/porte "
    rsync -avzh "$username"@"$porte_host":/data/backups/"$dbname"/"$dbname"_db_"${today_date}".sql /data/db-backup-daily/"$dbname"/
    
    printf '%s\n' "---> Send files to s3 "
    /usr/local/bin/s3cmd put /data/db-backup-daily/"$dbname"/"$dbname"_db_"${today_date}".sql s3://rt-"$dbname"-db
    
    printf '%s\n' "---> Delete old backups "
    cd /data/db-backup-daily/"$dbname"/ && ls -tp | grep -v '/$' | tail -n +4 | xargs -I {} rm -- {}
    
    printf '%s %s\n' "$(date)" "---> Delete files from server "
    ssh -o StrictHostKeyChecking=no "$username"@"$porte_host" rm -rf /data/backups/"$dbname"/"$dbname"_db_*.sql
    
    printf '____________________________________________________________________________________\n'
    
    ) &>> $LOGFILE ;;
  
  gwc)
    (
    printf '%s %s\n' "$(date)" "---> Create full backup from $dbname "
    ssh -o StrictHostKeyChecking=no "$username"@"$gwc_host" pg_dump --file /data/backups/"$dbname"/"$dbname"_db_"${today_date}".sql --host "127.0.0.1" \
    --port "5432" --username "postgres" --no-password --role "postgres" --format=c --blobs --encoding "UTF8" "$dbname"
    
    echo -e "$?"  >> /var/log/db_backup_logs/gwc_backup_exit_code.log
    
    printf '%s\n' "---> Copy file to /data/db-backup-daily/gwc"
    rsync -avzh "$username"@"$gwc_host":/data/backups/"$dbname"/"$dbname"_db_"${today_date}".sql /data/db-backup-daily/"$dbname"/
    
    printf '%s\n' "---> Send files to s3 "
    /usr/local/bin/s3cmd put --delete-after /data/db-backup-daily/"$dbname"/"$dbname"_db_"${today_date}".sql s3://rt-"$dbname"-db
    
    printf '%s\n' "---> Delete old backups "
    cd /data/db-backup-daily/"$dbname"/ && ls -tp | grep -v '/$' | tail -n +4 | xargs -I {} rm -- {}
    
    printf '%s %s\n' "$(date)" "---> Delete files from server "
    ssh -o StrictHostKeyChecking=no "$username"@"$gwc_host" rm -rf /data/backups/"$dbname"/"$dbname"_db_*.sql
    
    printf '____________________________________________________________________________________\n'
    
    ) &>> $LOGFILE ;;

  map)
    (
    printf '%s %s\n' "$(date)" "---> Create full backup from $dbname "
    ssh -o StrictHostKeyChecking=no "$username"@"$map_host" pg_dump --file /data/backups/"$dbname"/"$dbname"_db_"${today_date}".sql --host "127.0.0.1" \
    --port "5432" --username "postgres" --no-password --role "postgres" --format=c --blobs --encoding "UTF8" "$dbname"
    
    echo -e "$?"  >> /var/log/db_backup_logs/map_backup_exit_code.log
    
    printf '%s\n' "---> Copy file to /data/db-backup-daily/map"
    rsync -avzh "$username"@"$map_host":/data/backups/"$dbname"/"$dbname"_db_"${today_date}".sql /data/db-backup-daily/"$dbname"/
    
    printf '%s\n' "---> Send files to s3 "
    /usr/local/bin/s3cmd put /data/db-backup-daily/"$dbname"/"$dbname"_db_"${today_date}".sql s3://rt-"$dbname"-db
    
    printf '%s\n' "---> Delete old backups "
    cd /data/db-backup-daily/"$dbname"/ && ls -tp | grep -v '/$' | tail -n +4 | xargs -I {} rm -- {}
    
    printf '%s %s\n' "$(date)" "---> Delete files from server "
    ssh -o StrictHostKeyChecking=no "$username"@"$map_host" rm -rf /data/backups/"$dbname"/"$dbname"_db_*.sql
    
    printf '____________________________________________________________________________________\n'
    
    ) &>> $LOGFILE ;;
   
  platform)
    (
    printf '%s %s\n' "$(date)" "---> Create full backup from $dbname "
    ssh -o StrictHostKeyChecking=no "$username"@"$platform_host" docker exec -t postgres_platform pg_dump --file /opt/backups/"$dbname"/"$dbname"_db_"${today_date}".sql \
    --host "127.0.0.1" --port "5432" --username "postgres" --no-password --role "postgres" --format=c --blobs --encoding "UTF8" "$dbname"

    echo -e "$?"  >> /var/log/db_backup_logs/platform_backup_exit_code.log
    
    printf '%s\n' "---> Copy file to /data/db-backup-daily/platform"
    rsync -avzh "$username"@"$platform_host":/srv/db/postgres-platform/backups/"$dbname"/"$dbname"_db_"${today_date}".sql /data/db-backup-daily/"$dbname"/
    
    printf '%s\n' "---> Send files to s3 "
    /usr/local/bin/s3cmd put /data/db-backup-daily/"$dbname"/"$dbname"_db_"${today_date}".sql s3://rt-"$dbname"-db
    
    printf '%s\n' "---> Delete old backups "
    cd /data/db-backup-daily/"$dbname"/ && ls -tp | grep -v '/$' | tail -n +4 | xargs -I {} rm -- {}
    
    printf '%s %s\n' "$(date)" "---> Delete files from server "
    ssh -o StrictHostKeyChecking=no "$username"@"$platform_host" rm -rf /srv/db/postgres-platform/backups/"$dbname"/"$dbname"_db_*.sql
    
    printf '____________________________________________________________________________________\n'
    
    ) &>> $LOGFILE ;;

esac
```
