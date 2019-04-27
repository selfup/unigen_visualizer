defmodule UniApiWeb.PageController do
  use UniApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def small(conn, _params) do
    json(conn, Unigen.build(10))
  end

  def large(conn, _params) do
    json(conn, Unigen.build(30))
  end
end
