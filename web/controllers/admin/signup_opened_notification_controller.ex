defmodule AgileCoachCampex.Admin.SignupOpenedNotificationController do
  use AgileCoachCampex.Web, :controller

  alias AgileCoachCampex.SignupOpenedNotification

  plug :scrub_params, "signup_opened_notification" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    signup_opened_notifications = Repo.all(SignupOpenedNotification)
    render(conn, "index.html", signup_opened_notifications: signup_opened_notifications)
  end

  def new(conn, _params) do
    changeset = SignupOpenedNotification.changeset(%SignupOpenedNotification{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"signup_opened_notification" => signup_opened_notification_params}) do
    changeset = SignupOpenedNotification.changeset(%SignupOpenedNotification{}, signup_opened_notification_params)

    if changeset.valid? do
      Repo.insert(changeset)

      conn
      |> put_flash(:info, "SignupOpenedNotification created successfully.")
      |> redirect(to: admin_signup_opened_notification_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    signup_opened_notification = Repo.get(SignupOpenedNotification, id)
    render(conn, "show.html", signup_opened_notification: signup_opened_notification)
  end

  def edit(conn, %{"id" => id}) do
    signup_opened_notification = Repo.get(SignupOpenedNotification, id)
    changeset = SignupOpenedNotification.changeset(signup_opened_notification)
    render(conn, "edit.html", signup_opened_notification: signup_opened_notification, changeset: changeset)
  end

  def update(conn, %{"id" => id, "signup_opened_notification" => signup_opened_notification_params}) do
    signup_opened_notification = Repo.get(SignupOpenedNotification, id)
    changeset = SignupOpenedNotification.changeset(signup_opened_notification, signup_opened_notification_params)

    if changeset.valid? do
      Repo.update(changeset)

      conn
      |> put_flash(:info, "SignupOpenedNotification updated successfully.")
      |> redirect(to: admin_signup_opened_notification_path(conn, :index))
    else
      render(conn, "edit.html", signup_opened_notification: signup_opened_notification, changeset: changeset)
    end
  end

  # def delete(conn, %{"id" => id}) do
  #   signup_opened_notification = Repo.get(SignupOpenedNotification, id)
  #   Repo.delete(signup_opened_notification)

  #   conn
  #   |> put_flash(:info, "SignupOpenedNotification deleted successfully.")
  #   |> redirect(to: admin_signup_opened_notification_path(conn, :index))
  # end
end
