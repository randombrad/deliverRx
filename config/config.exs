# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :deliverRx,
  ecto_repos: [DeliverRx.Repo]

# Configures the endpoint
config :deliverRx, DeliverRxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "24rWAZx1dRIyugSLaxMETmIZXNqeeuL9kvHaF61B4+e7hO9eejOVik+A0oGfBmgJ",
  render_errors: [view: DeliverRxWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DeliverRx.PubSub,
  live_view: [signing_salt: "WKunWebE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :deliverRx, :pow,
  user: DeliverRx.Users.User,
  repo: DeliverRx.Repo,
  web_module: DeliverRxWeb,
  extensions: [PowResetPassword],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: DeliverRxWeb.PowMailer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
