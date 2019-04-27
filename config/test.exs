use Mix.Config

config :uni_api, UniApiWeb.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn
