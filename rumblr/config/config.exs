# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rumblr,
  ecto_repos: [Rumblr.Repo]

# Configures the endpoint
config :rumblr, Rumblr.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "g0aG8KnNUvefhIMX5pPTGqp+qEH2C8CWQd5Qa0tInSIE0P7yEMdil9DxpiaCZKYx",
  render_errors: [view: Rumblr.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Rumblr.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
