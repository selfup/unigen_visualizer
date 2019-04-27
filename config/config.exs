# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :uni_api, UniApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gi5/Mtpp81FVVqbDlGAIfEO7ks9hL4OShUDQnmnXazyYGZJYeNl1y9E50GNF99fD",
  render_errors: [view: UniApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Smache.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
