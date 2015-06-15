defmodule AgileCoachCampex.Admin.AccessController do
  use AgileCoachCampex.Web, :controller

  plug :action

  def login(conn, _params) do
    render conn, "login.html"
  end

  def logout(conn, _params) do
    conn
    |> put_session(:username, nil)
    |> put_flash(:notice, "Logged out.")
    |> redirect(to: admin_access_path(conn, :login))
  end

  def login_process(conn, params) do
    IO.inspect Settings.Admin.password
    user=find_user(params["password"]==Settings.Admin.password, params)
    IO.inspect user
    if user == nil do
      conn
      |> put_flash(:error, "Username and or password was wrong")
      |> render "login.html"
    else
      conn
      |> put_session(:username, params["username"])
      |> put_flash(:notice, "Login succeeded.")
      |> redirect(to: admin_signup_opened_notification_path(conn, :index))
    end
  end

  def find_user(true, params),  do: %{username: params["username"]}
  def find_user(_,_),           do: nil

end