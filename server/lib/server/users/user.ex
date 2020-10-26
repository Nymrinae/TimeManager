defmodule Server.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email, :string
    field :password, :string
    field :raw_password, :string, virtual: true
    has_one :clock, Server.Clocks.Clock

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
    |> validate_changeset
  end

  defp validate_changeset(struct) do
    struct
      |> validate_length(:email, min: 5, max: 255)
      |> validate_format(:email, ~r/@/, [message: "Must be a valid email"])
      |> unique_constraint(:email)
      |> validate_length(:password, min: 5, max: 16)
      |> generate_password_hash
  end

  defp generate_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
