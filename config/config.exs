# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :shopping,
  ecto_repos: [Shopping.Repo]

# Configures the endpoint
config :shopping, ShoppingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ega3EXLbp5JigFVjZZYQ3Wbl0jI5wN9nBu0b+JmAGLv7q20bVDLdmrGlz432cnta",
  render_errors: [view: ShoppingWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Shopping.PubSub,
  live_view: [signing_salt: "+xjwPc5/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, []}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "cdec728abc3f62b66445",
  client_secret: "8b66a0299e2dd886d8581ddc77fd51bbdc0f4568"
