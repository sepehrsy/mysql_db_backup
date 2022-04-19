## mysql_db_backup 
### cronjob:
####EOF /etc/crontab

```
22     02     *     *     *     root    /usr/local/bin/db-backup.sh >> /var/log/backup.log 2>&1
```
