defmodule UniApi.Router do
  use UniApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :put_secure_browser_headers
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/api/v1", UniApi do
    pipe_through :api

    get "/small", PageController, :small
    get "/incremental", PageController, :incremental
  end

  scope "/api", UniApi do
    pipe_through :browser

    get "/", PageController, :index
  end
end
