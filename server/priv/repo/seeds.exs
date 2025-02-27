# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Server.Repo.insert!(%Server.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Server.Repo
alias Server.Users.User
alias Server.Clocks.Clock
alias Server.WorkingTimes.WorkingTime

Repo.insert! %Clock{
  status: true,
  time: DateTime.truncate(DateTime.utc_now(), :second),
  user_id: 1
}
