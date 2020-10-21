defmodule Server.Repo.Migrations.FixClockReltion do
  use Ecto.Migration

  def change do
    drop(constraint(:clocks, "clocks_user_id_fkey"))
    alter table(:clocks) do
      modify :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
