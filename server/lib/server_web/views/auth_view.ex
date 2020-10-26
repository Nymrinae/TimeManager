defmodule ServerWeb.AuthView do
  use ServerWeb, :view

  def render("success.json", _params) do
    %{
      status: :ok,
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
end
