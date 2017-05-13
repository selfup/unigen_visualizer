defmodule UniApi.PageControllerTest do
  use UniApi.ConnCase

  test "GET /api/v1/small", %{conn: conn} do
    conn = get conn, "/api/v1/small"
    %{"charge" => charge, "universe" => universe} = json_response(conn, 200)

    assert is_list(universe) == true
    assert length(universe) == 27
    assert charge == "ionic" || charge == "anionic" || charge == "neutral"
  end

  test "GET /api/v1/incremental", %{conn: conn} do
    conn = get conn, "/api/v1/incremental?size=1"
    response = json_response(conn, 200)

    assert is_list(response) == true
    assert length(response) == 1
  end
end
