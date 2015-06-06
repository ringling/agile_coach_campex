defmodule AgileCoachCampex.ProgrammeController do
  use AgileCoachCampex.Web, :controller

  alias AgileCoachCampex.Programme

  plug :scrub_params, "programme" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    programmes = Repo.all(Programme)
    render(conn, "index.html", programmes: programmes)
  end

  def new(conn, _params) do
    changeset = Programme.changeset(%Programme{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"programme" => programme_params}) do
    changeset = Programme.changeset(%Programme{}, programme_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Programme created successfully.")
      |> redirect(to: programme_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    programme = Repo.get(Programme, id)
    render(conn, "show.html", programme: programme)
  end

  def edit(conn, %{"id" => id}) do
    programme = Repo.get(Programme, id)
    changeset = Programme.changeset(programme)
    render(conn, "edit.html", programme: programme, changeset: changeset)
  end

  def update(conn, %{"id" => id, "programme" => programme_params}) do
    programme = Repo.get(Programme, id)
    changeset = Programme.changeset(programme, programme_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Programme updated successfully.")
      |> redirect(to: programme_path(conn, :index))
    else
      render(conn, "edit.html", programme: programme, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    programme = Repo.get(Programme, id)
    Repo.delete(programme)

    conn
    |> put_flash(:info, "Programme deleted successfully.")
    |> redirect(to: programme_path(conn, :index))
  end
end
