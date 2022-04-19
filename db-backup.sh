#!/bin/bash

backupfolder=/Backup
user=root
password=lbIJDb7T3svY
keep_day=15
sqlfile=$backupfolder/all-database-$(date +%d-%m-%Y_%H-%M-%S).sql
xzfile=$backupfolder/all-database-$(date +%d-%m-%Y_%H-%M-%S).sql.xz
mysqldump -u $user -p$password --all-databases > $sqlfile
if [ $? == 0 ]; then
  echo 'Sql dump created' 
else
  echo 'mysqldump return non-zero code'
  exit
fi
xz $sqlfile
if [ $? == 0 ]; then
  echo 'The backup was successfully compressed' 
else
  echo 'Error compressing backup'
  exit
fi
find $backupfolder -mtime +$keep_day -delete

