defmodule UniApi.Router do
  use UniApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :put_secure_browser_headers
  end

  scope "/api/v1", UniApi do
    pipe_through :api

    get "/small", PageController, :index
    get "/incremental", PageController, :incremental
  end
end
