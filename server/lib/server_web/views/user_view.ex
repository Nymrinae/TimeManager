defmodule ServerWeb.UserView do
  use ServerWeb, :view
  alias ServerWeb.UserView

  def render("index.json", %{users: users}) do
    %{
      users: render_many(users, UserView, "user.json")
    }
  end

  def render("show.json", %{user: user}) do
    %{
      data: render_one(user, UserView, "user.json")
    }
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      role: user.role,
      username: user.username
    }
  end
end
