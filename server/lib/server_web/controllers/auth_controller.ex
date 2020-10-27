defmodule ServerWeb.AuthController do
  use ServerWeb, :controller

  alias Server.Repo
  alias Server.Users
  alias Server.Users.User

  action_fallback ServerWeb.FallbackController

  def login(conn, %{"email" => email, "password" => password}) do
    case Users.login_user(email, password) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :api)
        conn |> render("sign_in.json", user: user, jwt: jwt)
      {:error, _reason} ->
        conn
        |> put_status(401)
        |> render("error.json")
    end
  end

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
