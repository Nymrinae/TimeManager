defmodule ServerWeb.SessionController do
  use ServerWeb, :controller

  alias Server.{Users, Users.User, Users.Guardian}

  def new(conn, _) do
    changeset = Users.change_user(%User{})
    maybe_user = Guardian.Plug.current_resource(conn)
    if maybe_user do
      redirect(conn, to: "/protected")
    else
      render(conn, "new.html", changeset: changeset, action: Routes.session_path(conn, :login))
    end
  end

  def login(conn, %{"username" => username, "password" => password}) do
    case Users.authenticate_user(username, password) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> put_status(200)
        |> render("success.json", user: user)
      {:error, _reason} ->
        conn
        |> put_status(401)
        |> render("error.json", message: "Can't login")
    end
  end

  def logout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> redirect(to: "/login")
  end

  defp login_reply({:ok, user}, conn) do
    conn
    |> put_status(200)
    |> put_flash(:info, "Welcome back!")
    |> Guardian.Plug.sign_in(user)
  end

  defp login_reply({:error, reason}, conn) do
    conn
    |> put_flash(:error, to_string(reason))
    |> new(%{})
  end
end
