defmodule ServerWeb.AuthView do
  use ServerWeb, :view

  def render("success.json", _params) do
    %{
      status: 201,
      message: """
        Successfully registered!
      """
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
