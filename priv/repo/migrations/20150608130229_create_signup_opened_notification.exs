defmodule AgileCoachCampex.Repo.Migrations.CreateSignupOpenedNotification do
  use Ecto.Migration

  def change do
    create table(:signup_opened_notifications) do
      add :email, :string

      timestamps
    end

  end
end
