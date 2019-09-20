# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :firebase_chatex,
  ecto_repos: [FirebaseChatex.Repo]

# Configures the endpoint
config :firebase_chatex, FirebaseChatexWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "epwumhzgIg5agzlBTjMMwB1lvvVf261x4zu4tr0Ft/Z3HZOjq9uosZG+ySTVEzfb",
  render_errors: [view: FirebaseChatexWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FirebaseChatex.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
