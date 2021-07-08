defmodule ElxK8sWeb.Router do
  use ElxK8sWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ElxK8sWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElxK8sWeb do
    pipe_through :browser

    live "/cars", CarLive.Index, :index
    live "/cars/new", CarLive.Index, :new
    live "/cars/:id/edit", CarLive.Index, :edit

    live "/cars/:id", CarLive.Show, :show
    live "/cars/:id/show/edit", CarLive.Show, :edit

    live "/categories", CategoryLive.Index, :index
    live "/categories/new", CategoryLive.Index, :new
    live "/categories/:id/edit", CategoryLive.Index, :edit

    live "/categories/:id", CategoryLive.Show, :show
    live "/categories/:id/show/edit", CategoryLive.Show, :edit

    live "/", PageLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElxK8sWeb do
  #   pipe_through :api
  # end

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
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ElxK8sWeb.Telemetry
    end
  end
end
