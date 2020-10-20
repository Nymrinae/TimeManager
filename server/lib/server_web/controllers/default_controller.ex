defmodule ServerWeb.DefaultController do
  use ServerWeb, :controller

  def index(conn, _params) do
    text conn, "Time Manager API located to /api"
  end

  def indexAPI(conn, _params) do
    text conn, "Time Manager API"
  end
end
