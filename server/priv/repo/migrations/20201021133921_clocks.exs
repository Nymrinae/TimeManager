defmodule Server.Repo.Migrations.Clocks do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add :time, :utc_datetime
      add :status, :boolean
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

  end
end
