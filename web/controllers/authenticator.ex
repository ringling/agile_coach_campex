defmodule Authenticator do
  import Plug.Conn, only: [halt: 1, get_session: 2]
  import Phoenix.Controller, only: [redirect: 2]
  import AgileCoachCampex.Router.Helpers

  def init(options), do: options

  def call(conn, options) do
    authenticate(conn, options)
  end

  defp authenticate(conn, options) do
    case get_session(conn, :username) do
      nil -> redirect(conn, to: admin_access_path(conn, :login)) |> halt
      _ ->   conn
    end
  end

end