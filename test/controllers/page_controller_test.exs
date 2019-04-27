defmodule UniApi.PageControllerTest do
  use UniApi.ConnCase

  test "GET /api/v1/small", %{conn: conn} do
    conn = get(conn, "/api/v1/small")
    %{"charge" => charge, "universe" => universe} = json_response(conn, 200)

    assert is_list(universe) == true
    assert length(universe) == 1331
    assert charge == "ionic" || charge == "anionic" || charge == "neutral"
  end

  test "GET /api/v1/incremental without abusive size", %{conn: conn} do
    conn = get(conn, "/api/v1/incremental?size=1")

    %{
      "universes" => universes,
      "abuse" => abuse,
      "message" => message
    } = json_response(conn, 200)

    assert is_list(universes) == true
    assert length(universes) == 1
    assert abuse == false
    assert message == "here is a free sample!"
  end

  test "GET /api/v1/incremental with abusive size", %{conn: conn} do
    conn = get(conn, "/api/v1/incremental?size=11")

    %{
      "universes" => universes,
      "abuse" => abuse,
      "message" => message
    } = json_response(conn, 200)

    abuse_message = "the size param you provided is too large for this free api"

    assert universes == nil
    assert abuse == true
    assert message == abuse_message
  end
end
