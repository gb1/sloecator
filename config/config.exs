# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sloecator,
  ecto_repos: [Sloecator.Repo]

# Configures the endpoint
config :sloecator, SloecatorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "L4YReOAGp/utQcSy9WwADlATwlcY6lWXR2Yps06M/cG8sMlyyZUAOuyO6cYqeOgp",
  render_errors: [view: SloecatorWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Sloecator.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :arc,
  storage: Arc.Storage.GCS,
  bucket: "smearadubha-images"

config :goth,
  json: "gcp/smearadubha-213022-d18e6c7c7b52.json" |> Path.expand |> File.read!
