defmodule Server.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email, :string
    has_many :clock, Server.Clocks.Clock

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
  end
end
