# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elx_k8s,
  ecto_repos: [ElxK8s.Repo]

# Configures the endpoint
config :elx_k8s, ElxK8sWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "irOd6CF3j32M5EkbPY77NZ/WQjKAxhbuhA3ctIhb89NhlmBm0FvDXpN5hd9HGbEl",
  render_errors: [view: ElxK8sWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElxK8s.PubSub,
  live_view: [signing_salt: "GdtWMzut"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
