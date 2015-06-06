defmodule AgileCoachCampex.LayoutView do
  use AgileCoachCampex.Web, :view

  def menu_class(conn, type) do
    state(conn.private.phoenix_controller, type)
  end

  def state(controller, type) do 
    {:ok, regex} = type |> Regex.compile
    ctrl_str = controller |> Atom.to_string |> String.downcase
    if Regex.match?(regex, ctrl_str), do: "active", else: ""
  end

end
