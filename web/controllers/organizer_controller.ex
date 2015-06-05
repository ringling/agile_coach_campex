defmodule AgileCoachCampex.OrganizerController do
  use AgileCoachCampex.Web, :controller

  alias AgileCoachCampex.Organizer

  plug :scrub_params, "organizer" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    # organizers = Repo.all(Organizer)
    organizers = []
    render(conn, "index.html", organizers: organizers)
  end

  def new(conn, _params) do
    changeset = Organizer.changeset(%Organizer{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"organizer" => organizer_params}) do
    changeset = Organizer.changeset(%Organizer{}, organizer_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "Organizer created successfully.")
      |> redirect(to: organizer_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    organizer = Repo.get(Organizer, id)
    render(conn, "show.html", organizer: organizer)
  end

  def edit(conn, %{"id" => id}) do
    organizer = Repo.get(Organizer, id)
    changeset = Organizer.changeset(organizer)
    render(conn, "edit.html", organizer: organizer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "organizer" => organizer_params}) do
    organizer = Repo.get(Organizer, id)
    changeset = Organizer.changeset(organizer, organizer_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "Organizer updated successfully.")
      |> redirect(to: organizer_path(conn, :index))
    else
      render(conn, "edit.html", organizer: organizer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    organizer = Repo.get(Organizer, id)
    Repo.delete(organizer)

    conn
    |> put_flash(:info, "Organizer deleted successfully.")
    |> redirect(to: organizer_path(conn, :index))
  end
end
