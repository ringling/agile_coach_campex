defmodule AgileCoachCampex.AccessControllerTest do
  use AgileCoachCampex.ConnCase

  alias AgileCoachCampex.SignupOpenedNotification
  @valid_attrs %{email: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "renders login form", %{conn: conn} do
    conn = get conn, admin_access_path(conn, :login)
    assert html_response(conn, 200) =~ "Login"
  end

  test "show error on failed login", %{conn: conn} do
    conn = post conn, admin_access_path(conn, :login_process), [username: "john", password: "doe"]
    assert get_flash(conn, :error) == "Username and or password was wrong"
    assert html_response(conn, 200) =~ "Username and or password was wrong"
  end

  test "redirect on successful login", %{conn: conn} do
    conn = post conn, admin_access_path(conn, :login_process), [username: "john", password: "test"]
    assert get_flash(conn, :notice) == "Login succeeded."
    assert html_response(conn, 302) =~ "redirected"
  end


  test "redirect to login form on logout", %{conn: conn} do
    conn = get conn, admin_access_path(conn, :logout)
    assert get_flash(conn, :notice) == "Logged out."
    assert html_response(conn, 302) =~ "redirected"
  end

end
