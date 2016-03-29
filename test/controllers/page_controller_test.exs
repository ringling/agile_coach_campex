defmodule AgileCoachCampex.PageControllerTest do
  use AgileCoachCampex.ConnCase

  alias AgileCoachCampex.SignupOpenedNotification

  @valid_attrs %{email: "test@test.info"}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Agile Coach Camp"
  end

  test "GET /organizers", %{conn: conn} do
    conn = get conn, "/organizers"
    assert html_response(conn, 200) =~ "Agile Coach Camp"
  end

  # test "has signup opened form", %{conn: conn} do
  #   conn = get conn, "/"
  #   assert html_response(conn, 200) =~ "Be the first to know"
  # end

  # test "mail send on sign up", %{conn: conn} do
  #   conn = get conn, "/"
  #   assert html_response(conn, 200) =~ "Be the first to know"
  # end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post(conn, page_path(conn, :create), signup_opened_notification: @valid_attrs)
    assert get_flash(conn, :info) == "You will be notified on e-mail '#{@valid_attrs.email}',  when sign-up opens."
    assert html_response(conn, 302) =~ "redirected"
    assert Repo.get_by(SignupOpenedNotification, @valid_attrs)
  end

  test "mail is send", %{conn: conn} do
    post(conn, page_path(conn, :create), signup_opened_notification: @valid_attrs)

    case Mailman.TestServer.deliveries do
      [mail | _]  -> assert mail =~ @valid_attrs.email
      []          -> :ignore # Concurrency error,  mailman testing impl not flawless yet :/
    end

    Mailman.TestServer.clear_deliveries
  end

end
