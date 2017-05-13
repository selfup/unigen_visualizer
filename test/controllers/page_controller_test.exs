defmodule UniApi.PageControllerTest do
  use UniApi.ConnCase

  test "GET /api/v1/small", %{conn: conn} do
    conn = get conn, "/api/v1/small"
    %{"charge" => charge} = json_response(conn, 200)

    assert charge == "ionic" || charge == "anionic" || charge == "neutral"
  end
end
