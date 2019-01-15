defmodule EcbServerTestWeb.Router do
  use EcbServerTestWeb, :router

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

  scope "/rates", EcbServerTestWeb do
    pipe_through :browser

    get "/:date", RateController, :date
    get "/latest", RateController, :latest
    get "/analyze", RateController, :analyze
  end
end
