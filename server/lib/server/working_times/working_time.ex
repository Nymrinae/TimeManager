defmodule Server.WorkingTimes.WorkingTime do
  use Ecto.Schema
  import Ecto.Changeset

  alias Server.Users.User

  schema "workingtimes" do
    field :end, :utc_datetime
    field :start, :utc_datetime
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(working_time, attrs) do
    working_time
    |> cast(attrs, [:start, :end, :user_id])
    |> validate_required([:start, :end, :user_id])
    # |> cast_assoc(:user)
  end
end
