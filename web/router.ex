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
    resources "/", PageController, only: [:index, :create]
    resources "/organizers", OrganizerController
    resources "/programs", ProgrammeController
    resources "/gallery", GalleryController
    resources "/sponsor", SponsorController
  end

  scope "/admin", AgileCoachCampex.Admin, as: :admin do
    pipe_through :browser
    resources "/signup_opened_notifications", SignupOpenedNotificationController
    get "/login", AccessController, :login
    get "/", AccessController, :login
    get "/logout", AccessController, :logout
    post "/login", AccessController, :login_process
  end

  # Other scopes may use custom stacks.
  # scope "/api", AgileCoachCampex do
  #   pipe_through :api
  # end
end
