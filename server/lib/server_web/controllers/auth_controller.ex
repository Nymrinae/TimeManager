defmodule ServerWeb.AuthController do
  use ServerWeb, :controller

  alias Server.Repo
  alias Server.{Users, Users.User, Users.Guardian}

  action_fallback ServerWeb.FallbackController

  def register(conn, params) do
    changeset = User.register_changeset(%User{}, params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.user_path(conn, :show, user))
        |> render("success.json", user: user)
      {:error, _reason} ->
        conn
        |> put_status(401)
        |> render("error.json", message: "Can't register")
    end
  end
end
