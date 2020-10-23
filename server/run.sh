#!/bin/bash
mix ecto.reset
mix ecto.migrate --to 20201022074505
# mix run priv/repo/init_db_seeds.exs
echo "Database $PG_DB created"
exec mix phx.server
