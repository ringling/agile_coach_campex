defmodule AgileCoachCampex.SignupOpenedNotificationControllerTest do
  use AgileCoachCampex.ConnCase

  alias AgileCoachCampex.SignupOpenedNotification
  @valid_attrs %{email: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, admin_signup_opened_notification_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing signup opened notifications"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, admin_signup_opened_notification_path(conn, :new)
    assert html_response(conn, 200) =~ "New signup opened notification"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, admin_signup_opened_notification_path(conn, :create), signup_opened_notification: @valid_attrs
    assert redirected_to(conn) == admin_signup_opened_notification_path(conn, :index)
    assert Repo.get_by(SignupOpenedNotification, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, admin_signup_opened_notification_path(conn, :create), signup_opened_notification: @invalid_attrs
    assert html_response(conn, 200) =~ "New signup opened notification"
  end

  test "shows chosen resource", %{conn: conn} do
    signup_opened_notification = Repo.insert %SignupOpenedNotification{}
    conn = get conn, admin_signup_opened_notification_path(conn, :show, signup_opened_notification)
    assert html_response(conn, 200) =~ "Show signup opened notification"
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    signup_opened_notification = Repo.insert %SignupOpenedNotification{}
    conn = get conn, admin_signup_opened_notification_path(conn, :edit, signup_opened_notification)
    assert html_response(conn, 200) =~ "Edit signup opened notification"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    signup_opened_notification = Repo.insert %SignupOpenedNotification{}
    conn = put conn, admin_signup_opened_notification_path(conn, :update, signup_opened_notification), signup_opened_notification: @valid_attrs
    assert redirected_to(conn) == admin_signup_opened_notification_path(conn, :index)
    assert Repo.get_by(SignupOpenedNotification, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    signup_opened_notification = Repo.insert %SignupOpenedNotification{}
    conn = put conn, admin_signup_opened_notification_path(conn, :update, signup_opened_notification), signup_opened_notification: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit signup opened notification"
  end

  test "deletes chosen resource", %{conn: conn} do
    signup_opened_notification = Repo.insert %SignupOpenedNotification{}
    conn = delete conn, admin_signup_opened_notification_path(conn, :delete, signup_opened_notification)
    assert redirected_to(conn) == admin_signup_opened_notification_path(conn, :index)
    refute Repo.get(SignupOpenedNotification, signup_opened_notification.id)
  end
end
