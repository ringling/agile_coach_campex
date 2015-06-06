defmodule AgileCoachCampex.Repo.Migrations.CreateProgramme do
  use Ecto.Migration

  def change do
    create table(:programmes) do
      add :year, :string

      timestamps
    end

  end
end
