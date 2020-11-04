defmodule Server.Repo.Migrations.CreateDB do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:users) do
      add :username, :string
      add :email, :string
      add :password, :string
      add :role, :string, default: "user"

      timestamps()
    end

    create_if_not_exists table(:clocks) do
      add :time, :utc_datetime
      add :status, :boolean
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create_if_not_exists table(:workingtimes) do
      add :start, :utc_datetime
      add :end, :utc_datetime
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end
  end
end
