# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :switches, SwitchesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AFH3ivJ8ofUxv4TFf3Kv3jIxT4Rs+bqsomDzN7TpVpcgowE9d+VVPngESukKvpl6",
  render_errors: [view: SwitchesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Switches.PubSub,
  live_view: [signing_salt: "Lz91vhBj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
