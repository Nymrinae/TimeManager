FROM ubuntu:14.04

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

RUN apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

USER postgres

RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER postgresuser WITH SUPERUSER PASSWORD 'postgres';" &&\
    createdb -O postgresuser time_manager_dev

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

COPY . .

RUN ["/bin/bash", "-D", "conf.sh"]
