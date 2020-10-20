defmodule Server.Repo.Migrations.CreateWorkingtimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
      add :start, :utc_datetime
      add :end, :utc_datetime
      add :user_id, references(:users)

      timestamps()
    end

  end
end
