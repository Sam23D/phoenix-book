# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :programming_phoenix,
  ecto_repos: [ProgrammingPhoenix.Repo]

# Configures the endpoint
config :programming_phoenix, ProgrammingPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sNmdI6tW/d4ArNu5N7+tipU8/Tna0lnXzXc6CvFH5b4XFtE7VD7gDZNqJ20xRSZ1",
  render_errors: [view: ProgrammingPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ProgrammingPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
