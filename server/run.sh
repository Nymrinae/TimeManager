#!/bin/bash
mix ecto.reset
mix ecto.migrate
mix run priv/repo/init_db_seeds.exs
echo "Database $PG_DB created"
exec mix phx.server
