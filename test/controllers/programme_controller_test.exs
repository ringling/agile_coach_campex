defmodule AgileCoachCampex.ProgrammeControllerTest do
  use AgileCoachCampex.ConnCase

  alias AgileCoachCampex.Programme
  @valid_attrs %{year: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, programme_path(conn, :index)
    assert html_response(conn, 200) =~ "Program"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, programme_path(conn, :new)
    assert html_response(conn, 200) =~ "New programme"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, programme_path(conn, :create), programme: @valid_attrs
    assert redirected_to(conn) == programme_path(conn, :index)
    assert Repo.get_by(Programme, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, programme_path(conn, :create), programme: @invalid_attrs
    assert html_response(conn, 200) =~ "New programme"
  end

  test "shows chosen resource", %{conn: conn} do
    {:ok, programme} = Repo.insert %Programme{}
    conn = get conn, programme_path(conn, :show, programme)
    assert html_response(conn, 200) =~ "Show programme"
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    {:ok, programme} = Repo.insert %Programme{}
    conn = get conn, programme_path(conn, :edit, programme)
    assert html_response(conn, 200) =~ "Edit programme"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    {:ok, programme} = Repo.insert %Programme{}
    conn = put conn, programme_path(conn, :update, programme), programme: @valid_attrs
    assert redirected_to(conn) == programme_path(conn, :index)
    assert Repo.get_by(Programme, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    {:ok, programme} = Repo.insert %Programme{}
    conn = put conn, programme_path(conn, :update, programme), programme: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit programme"
  end

  test "deletes chosen resource", %{conn: conn} do
    {:ok, programme} = Repo.insert %Programme{}
    conn = delete conn, programme_path(conn, :delete, programme)
    assert redirected_to(conn) == programme_path(conn, :index)
    refute Repo.get(Programme, programme.id)
  end
end
