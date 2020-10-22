# Script for populating the database if doesn't exist
# Automatically run by Docker

alias Server.Repo
alias Server.Users.User
alias Server.Clocks.Clock
alias Server.WorkingTimes.WorkingTime

Repo.insert! %Clock{
  status: true,
  time: DateTime.truncate(DateTime.utc_now(), :second),
  user_id: 1
}
