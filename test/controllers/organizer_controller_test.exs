defmodule AgileCoachCampex.OrganizerControllerTest do
  use AgileCoachCampex.ConnCase

  alias AgileCoachCampex.Organizer
  @valid_attrs %{email: "some content", name: "some content", phone: "some content", picture_url: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, organizer_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing organizers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, organizer_path(conn, :new)
    assert html_response(conn, 200) =~ "New organizer"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, organizer_path(conn, :create), organizer: @valid_attrs
    assert redirected_to(conn) == organizer_path(conn, :index)
    assert Repo.get_by(Organizer, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, organizer_path(conn, :create), organizer: @invalid_attrs
    assert html_response(conn, 200) =~ "New organizer"
  end

  test "shows chosen resource", %{conn: conn} do
    organizer = Repo.insert %Organizer{}
    conn = get conn, organizer_path(conn, :show, organizer)
    assert html_response(conn, 200) =~ "Show organizer"
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    organizer = Repo.insert %Organizer{}
    conn = get conn, organizer_path(conn, :edit, organizer)
    assert html_response(conn, 200) =~ "Edit organizer"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    organizer = Repo.insert %Organizer{}
    conn = put conn, organizer_path(conn, :update, organizer), organizer: @valid_attrs
    assert redirected_to(conn) == organizer_path(conn, :index)
    assert Repo.get_by(Organizer, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    organizer = Repo.insert %Organizer{}
    conn = put conn, organizer_path(conn, :update, organizer), organizer: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit organizer"
  end

  test "deletes chosen resource", %{conn: conn} do
    organizer = Repo.insert %Organizer{}
    conn = delete conn, organizer_path(conn, :delete, organizer)
    assert redirected_to(conn) == organizer_path(conn, :index)
    refute Repo.get(Organizer, organizer.id)
  end
end
