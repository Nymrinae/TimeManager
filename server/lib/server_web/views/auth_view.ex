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
end
