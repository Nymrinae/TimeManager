defmodule ServerWeb.ClockController do
  use ServerWeb, :controller

  alias Server.Clocks
  alias Server.Clocks.Clock

  action_fallback ServerWeb.FallbackController

  def index(conn, _params) do
    clocks = Clocks.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, clock_params) do
    send_resp(conn, 200, "error #{inspect Clocks.create_clock(clock_params)}")
    # with {:ok, %Clock{} = clock} <- Clocks.create_clock(clock_params) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
    #   |> render("show.json", clock: clock)
    # end
  end

  def show(conn, %{"id" => id}) do
    clock = Clocks.get_clock!(id)
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Clocks.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Clocks.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Clocks.get_clock!(id)

    with {:ok, %Clock{}} <- Clocks.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end
