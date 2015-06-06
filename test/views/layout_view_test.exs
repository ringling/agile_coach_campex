defmodule AgileCoachCampex.LayoutViewTest do
  use AgileCoachCampex.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "page returns active" do
    conn = %{private: %{phoenix_controller: AgileCoachCampex.PageController}}
    assert AgileCoachCampex.LayoutView.menu_class(conn, "page") == "active"
  end

  test "organizer returns not active" do
    conn = %{private: %{phoenix_controller: AgileCoachCampex.PageController}}
    assert AgileCoachCampex.LayoutView.menu_class(conn, "organizers") == ""
  end


end
