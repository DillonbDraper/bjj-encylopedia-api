defmodule BJJWeb.Router do
  use BJJWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BJJWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/positions", PositionController, except: [:new, :edit]
    resources "/subpositions", SubpositionController, except: [:new, :edit]
    resources "/techniques", TechniqueController, except: [:new, :edit]
    resources "/videos", VideoController, except: [:new, :edit]
    resources "/notes", NoteController, except: [:new, :edit]
    post "/users/sign_in", UserController, :sign_in

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
      live_dashboard "/dashboard", metrics: BJJWeb.Telemetry
    end
  end
end
