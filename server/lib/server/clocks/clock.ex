defmodule Server.Clocks.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  alias Server.Users.User

  schema "clocks" do
    field :status, :boolean, default: false
    field :time, :utc_datetime
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(clock, attrs) do
    clock
    |> cast(attrs, [:time, :status])
    |> validate_required([:time, :status])
  end
end
