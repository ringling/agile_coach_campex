defmodule AgileCoachCampex.PageControllerTest do
  use AgileCoachCampex.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Agile Coach Camp"
  end

  test "GET /organizers" do
    conn = get conn(), "/organizers"
    assert html_response(conn, 200) =~ "Agile Coach Camp"
  end
end
