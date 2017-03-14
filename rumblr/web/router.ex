defmodule Rumblr.Router do
  use Rumblr.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Rumblr.Auth, repo: Rumblr.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Rumblr do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [ :index, :show, :new, :create ]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Rumblr do
  #   pipe_through :api
  # end
end
