defmodule ServerWeb.ClockView do
  use ServerWeb, :view
  alias ServerWeb.ClockView

  def render("index.json", %{clocks: clocks}) do
    %{
      data: render_many(clocks, ClockView, "clock.json")
    }
  end

  def render("show.json", %{clock: clock}) do
    %{
      data: render_many(clock, ClockView, "clock.json")
    }
  end

  def render("clock.json", %{clock: clock}) do
    %{
      id: clock.id,
      time: clock.time,
      status: clock.status
    }
  end
end
