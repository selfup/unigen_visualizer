defmodule UniApi.PageController do
  use UniApi.Web, :controller

  def index(conn, _params) do
    json(conn, Unigen.build(2))
  end

  def incremental(conn, %{"size" => size} = params) do
    json(conn, Unigen.deploy_clusters(String.to_integer(size), true))
  end
end
