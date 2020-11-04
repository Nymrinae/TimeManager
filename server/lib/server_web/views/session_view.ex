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

  def render("sign_in.json", %{user: user, jwt: jwt}) do
    %{
      status: :ok,
      data: %{
        token: jwt,
        email: user.email
      },
      message: "You are successfully logged in!"
    }
  end

  def render("error.json", %{message: message}) do
    %{
      status: :bad_request,
      message: message
    }
  end
end
