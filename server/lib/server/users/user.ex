defmodule Server.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email, :string
    has_one :clock, Server.Clocks.Clock

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
<<<<<<< HEAD
    # |> foreign_key_constraint(:clock_id)
=======
    |> foreign_key_constraint(:clock, name: "clocks_user_fkey")
>>>>>>> set update without user field
  end
end
