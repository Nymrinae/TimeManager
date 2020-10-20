# Script for populating the database if doesn't exist
# Automatically run by Docker

alias Server.Repo
alias Server.Users.User
alias Server.Clocks.Clock
alias Server.WorkingTimes.WorkingTime

Repo.insert! %User{
  username: "admin",
  email: "admin@admin.com"
}

Repo.insert! %Clock{
  status: true,
  time: DateTime.truncate(DateTime.utc_now(), :second),
  user_id: 1
}

Repo.insert! %WorkingTime{
  start: DateTime.truncate(DateTime.utc_now(), :second),
  end: DateTime.truncate(DateTime.utc_now(), :second),
  user_id: 1
}
