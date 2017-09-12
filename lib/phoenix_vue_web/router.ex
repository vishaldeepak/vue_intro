defmodule PhoenixVueWeb.Router do
  use PhoenixVueWeb, :router

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

  pipeline :api_auth do
    plug PhoenixVue.AuthAccessPipeline  
  end

  scope "/", PhoenixVueWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", PhoenixVueWeb do
    pipe_through :api

    post "/register", AuthController, :register
    post "/login", AuthController, :login
  end

  scope "/api", PhoenixVueWeb do
    pipe_through [:api, :api_auth]

    get "/resource", AuthController, :resource
  end
end
