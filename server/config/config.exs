# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :server,
  ecto_repos: [Server.Repo]

# Configures the endpoint
config :server, ServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Psm5y2KiJsNpoWsIHDYllkbQfPBfzcW89kMxc2JAB986l0brtGoA3UC/G+94xgvG",
  render_errors: [view: ServerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Server.PubSub,
  live_view: [signing_salt: "Ou7SRJ1l"]

# Configure Guardian for JWT Auth
config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Server",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true,
  secret_key: "H07w2FRoSIVJu02fyd46FeEz3DEFm7icn7iOhyP7M/7y1InBFYurwrpF6dim+TTk",
  serializer: Server.GuardianSerializer

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
