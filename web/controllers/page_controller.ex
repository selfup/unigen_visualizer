defmodule UniApi.PageController do
  use UniApi.Web, :controller

  def index(conn, _params) do
    json(conn, Unigen.build(2))
  end
end
