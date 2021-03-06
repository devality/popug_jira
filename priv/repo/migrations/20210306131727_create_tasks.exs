defmodule PopugJira.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :state, :string, default: "open"

      timestamps()
    end
  end
end
