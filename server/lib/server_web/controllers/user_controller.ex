defmodule ServerWeb.UserController do
  use ServerWeb, :controller

  alias Server.Users
  alias Server.Users.User

  action_fallback ServerWeb.FallbackController

  # Change this to adapt with params
  # def index(conn, _params) do
  # users = Users.list_users()
  # render(conn, "index.json", users: users)
  # end

  def index(conn, params) do
    username = Map.get(params, "username", nil)
    email = Map.get(params, "email", nil)

    if username != nil && email != nil do
      user = Users.get_user_by_infos(username, email)
      render(conn, "show.json", user: user)
    else
      users = Users.list_users()
      render(conn, "index.json", users: users)
    end
  end

  def create(conn, user_params) do
    with {:ok, %User{} = user} <- Users.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user_by_id(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, params) do
    user = Users.get_user_by_id(Map.get(params, "id", ""))
    username = Map.get(params, "username", user.username)
    email = Map.get(params, "email", user.email)

    with {:ok, %User{} = user} <- Users.update_user(user, %{username: username, email: email}) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user_by_id(id)

    with {:ok, %User{}} <- Users.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
