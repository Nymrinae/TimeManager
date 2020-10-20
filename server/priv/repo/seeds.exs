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
alias Server.Account.User
alias Server.Clocks.Clock

Repo.insert! %Clock{
  status: false,
  time: DateTime.truncate(DateTime.utc_now(), :second),
  user: %User{first_name: "Sylvain", last_name: "RAYA"}
}
