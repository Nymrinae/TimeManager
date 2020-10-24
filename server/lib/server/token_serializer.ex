defmodule Server.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Server.Repo
  alias Server.Users.User

  def for_token(user = %User{}), do: { :ok, "User:#{user.id}"}
  def for_token(_), do: { :error, "Unknown Resource Type" }

  def from_token("User:" <> id), do: { :ok, Repo.get(User, id)}
  def from_token(_), do: { :error, "Unknown Resource Type" }
end
