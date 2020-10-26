defmodule ServerWeb.AuthController do
  use ServerWeb, :controller

  alias Server.Repo
  alias Server.Users.User

  action_fallback ServerWeb.FallbackController

  def register(conn, params) do
    changeset = User.register_changeset(%User{}, params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.user_path(conn, :show, user))
        |> render("success.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ServerWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
