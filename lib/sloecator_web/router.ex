defmodule SloecatorWeb.Router do
  use SloecatorWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SloecatorWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/location", LocationsController, :index
    get "/add", AddController, :index
    post "/add", AddController, :upload
    resources "/spots", SpotController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SloecatorWeb do
  #   pipe_through :api
  # end
end
