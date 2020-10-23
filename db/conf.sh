#!/bin/bash
postgres /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf
service postgresql start
echo "listen_addresses = '*'" >> /etc/postgresql/9.3/main/postgresql.conf
echo port = 5430 >> /etc/postgresql/9.3/main/postgresql.conf
echo host    all             all             192.168.1.0/24          md5 >> /etc/postgresql/9.3/main/pg_hba.conf
service postgresql restart
