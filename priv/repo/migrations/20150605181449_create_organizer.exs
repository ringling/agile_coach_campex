defmodule AgileCoachCampex.Repo.Migrations.CreateOrganizer do
  use Ecto.Migration

  def change do
    create table(:organizers) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :picture_url, :string

      timestamps
    end

  end
end
