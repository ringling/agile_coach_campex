defmodule AgileCoachCampex.SponsorController do
  use AgileCoachCampex.Web, :controller

  alias AgileCoachCampex.Sponsor

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
