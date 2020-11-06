defmodule ServerWeb.Router do
  use ServerWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Server.Users.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", ServerWeb do
    get "/", DefaultController, :index
  end

  scope "/api", ServerWeb do
    pipe_through :api
    get "/", DefaultController, :indexAPI

    post "/login", SessionController, :login
    get "/logout", SessionController, :logout
    post "/register", AuthController, :register

    scope "/clocks" do
      get "/", ClockController, :index
      get "/:id", ClockController, :show
      post "/:user_id", ClockController, :create
    end

    pipe_through :auth
    resources "/users", UserController, except: [:new, :edit]

    scope "/workingtimes" do
      get "/", WorkingTimeController, :index
      post "/", WorkingTimeController, :create
      delete "/:id", WorkingTimeController, :delete
    end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: ServerWeb.Telemetry
    end
  end
end
