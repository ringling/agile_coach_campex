defmodule AgileCoachCampex.Router do
  use AgileCoachCampex.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AgileCoachCampex do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/organizers", OrganizerController
    resources "/programs", ProgrammeController
  end

  # Other scopes may use custom stacks.
  # scope "/api", AgileCoachCampex do
  #   pipe_through :api
  # end
end
