defmodule ServerWeb.SessionView do
  use ServerWeb, :view

  def render("success.json", %{user: user, token: jwt }) do
    %{
      status: :ok,
      user: %{
        id: user.id,
        username: user.username,
        role: user.role
      },
      token: jwt
    }
  end

  def render("success.json", %{message: message}) do
    %{
      status: 200,
      message: message
    }
  end

  def render("error.json", %{message: message}) do
    %{
      status: :bad_request,
      message: message
    }
  end
end
