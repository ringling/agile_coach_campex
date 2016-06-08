defmodule AgileCoachCampex.GalleryController do
  use AgileCoachCampex.Web, :controller

  alias AgileCoachCampex.Gallery

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
