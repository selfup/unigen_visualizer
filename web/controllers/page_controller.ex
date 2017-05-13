defmodule UniApi.PageController do
  use UniApi.Web, :controller

  def index(conn, _params) do
    json(conn, Unigen.build(2))
  end

  def incremental(conn, %{"size" => size} = params) do
    number_size = String.to_integer(size)

    if number_size < 11 do
      json(
        conn,
        %{
          universes: Unigen.deploy_clusters(number_size, true),
          abuse: false,
          message: "here is a free sample!"
        }
      )
    else
      json(
        conn,
        %{
          universes: nil,
          abuse: true,
          message: "the size param you provided is to large for this free api"
        }
      )
    end
  end
end
