defmodule AgileCoachCampex.LayoutView do
  use AgileCoachCampex.Web, :view

  def menu_class(conn, type) do
    state(conn.private.phoenix_controller, type)
  end

  def state(AgileCoachCampex.OrganizerController, 'organizer'), do: 'active'
  def state(AgileCoachCampex.PageController, 'page'), do: 'active'
  def state(_, _), do: ""

end
