#!/bin/bash

while !pg_isready -q -h $PG_HOST -p $PG_PORT -U $PG_USER
do
  echo "Waiting for database to start..."
  sleep 2
done

if [[ -z `psql -ATqc "\\list $PG_DB"`]]; then
  echo "Creating database..."
  createdb -E UTF-8 $PG_DB -l en_US.UTF-8 -T template0
  # create general migration file to create all tables
  mix ecto.migrate
  mix run priv/repo/init_db_seeds.exs
  echo "Database $PG_DB created"
fi

exec mix phx.server