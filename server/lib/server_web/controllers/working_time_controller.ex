defmodule ServerWeb.WorkingTimeController do
  use ServerWeb, :controller

  alias Server.WorkingTimes
  alias Server.WorkingTimes.WorkingTime

  action_fallback ServerWeb.FallbackController

  def index(conn, params) do
    id = Map.get(params, "id", nil)
    start_time = Map.get(params, "start", nil)
    end_time = Map.get(params, "end", nil)

    if id != nil && start_time != nil && end_time != nil do
      workingtime = WorkingTime.get_working_time_by_queries(id, start_time, end_time)
      render(conn, "show.json", workingtime: workingtime)
    else
      workingtimes = WorkingTimes.list_workingtimes()
      render(conn, "index.json", workingtimes: workingtimes)
    end
  end

  def create(conn, %{"working_time" => working_time_params}) do
    with {:ok, %WorkingTime{} = working_time} <- WorkingTimes.create_working_time(working_time_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.working_time_path(conn, :show, working_time))
      |> render("show.json", working_time: working_time)
    end
  end

  def show(conn, %{"id" => id}) do
    working_time = WorkingTimes.get_working_time(id)
    render(conn, "show.json", working_time: working_time)
  end

  def update(conn, %{"id" => id, "working_time" => working_time_params}) do
    working_time = WorkingTimes.get_working_time(id)

    with {:ok, %WorkingTime{} = working_time} <- WorkingTimes.update_working_time(working_time, working_time_params) do
      render(conn, "show.json", working_time: working_time)
    end
  end

  def delete(conn, %{"id" => id}) do
    working_time = WorkingTimes.get_working_time(id)

    if working_time != nil do
      WorkingTimes.delete_working_time(working_time)
      send_resp(conn, 200, "Successfully deleted!")
    else
      send_resp(conn, 404, "Working time not found")
    end
  end
end
