defmodule UniApiWeb.Router do
  use UniApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", UniApiWeb do
    pipe_through(:api)

    get("/", PageController, :index)

    get("/small", PageController, :small)

    get("/large", PageController, :large)
  end
end
