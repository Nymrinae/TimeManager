defmodule Server.Repo.Migrations.UpdateUser do
  use Ecto.Migration

  def change do
    rename table(:users), :last_name, to: :email
  end
end
