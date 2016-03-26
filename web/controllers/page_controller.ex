defmodule AgileCoachCampex.PageController do
  use AgileCoachCampex.Web, :controller

  def index(conn, _params) do
    changeset = AgileCoachCampex.SignupOpenedNotification.changeset(%AgileCoachCampex.SignupOpenedNotification{})
    render(conn, "index.html", changeset: changeset)
  end

  def create(conn, %{"signup_opened_notification" => signup_opened_notification_params}) do
    changeset = AgileCoachCampex.SignupOpenedNotification.changeset(%AgileCoachCampex.SignupOpenedNotification{}, signup_opened_notification_params)
    if changeset.valid? do
      {:ok, son} = Repo.insert(changeset)
      send_confirmation_mail(son.email)

      conn
      |> put_flash(:info, "You will be notified on e-mail '#{son.email}',  when sign-up opens.")
      |> redirect(to: page_path(conn, :index))
    else
      render(conn, "index.html", changeset: changeset)
    end
  end

  defp send_confirmation_mail(to) do
    to |> SignupOpenNotificationMail.mail |> AgileCoachCampex.Mailer.deliver
  end

end
