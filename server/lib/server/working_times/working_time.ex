defmodule Server.WorkingTimes.WorkingTime do
  use Ecto.Schema
  import Ecto.Changeset

  alias Server.Users.User

  schema "workingtimes" do
    field :end, :utc_datetime
    field :start, :utc_datetime
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(working_time, attrs) do
    working_time
    |> cast(attrs, [:start, :end])
    |> validate_required([:start, :end])
    |> cast_assoc(:user)
  end
end
