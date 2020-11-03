defmodule Server.Repo.Migrations.AddTeamsField do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :role, :string, default: "user", null: false
    end
  end
end
