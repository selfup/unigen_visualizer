defmodule UniApiWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :uni_api

  if code_reloading? do
    plug(Phoenix.CodeReloader)
  end

  plug(Plug.RequestId)
  plug(Plug.Logger)

  plug(
    Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Jason
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)
  plug(UniApiWeb.Router)

  def init(_key, config) do
    if config[:load_from_system_env] do
      port = System.get_env("PORT") || raise "PLZ SET $PORT ENV VAR"
      {:ok, Keyword.put(config, :http, [:inet6, port: port])}
    else
      {:ok, config}
    end
  end
end
