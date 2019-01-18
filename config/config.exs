# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ecb_app,
  ecto_repos: [EcbApp.Repo]

# Configures the endpoint
config :ecb_app, EcbAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Vvg4/B2hj7ajgx49UfrA2CJ1hTMkg9vtH8L0ArGkL9OG5gTPJAnqc0doOvkco1yI",
  render_errors: [view: EcbAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EcbApp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
