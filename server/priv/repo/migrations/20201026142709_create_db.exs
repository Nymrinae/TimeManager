defmodule Server.Repo.Migrations.InitDb do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:users) do
      add :username, :string
      add :email, :string
      add :password, :string
      add :role, :string, default: "user"

      timestamps()
    end

    create_if_not_exists table(:workingtimes) do
      add :start, :utc_datetime
      add :end, :utc_datetime
      add :user_id, :integer

      timestamps()
    end

    create_if_not_exists table(:teams) do
      add :name, :string

      timestamps()
    end

    alter table(:users) do
      add :team_id, references(:teams, on_delete: :delete_all)
    end

    alter table(:teams) do
      add :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
