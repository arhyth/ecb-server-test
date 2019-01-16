defmodule EcbServerTestWeb.Router do
  use EcbServerTestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EcbServerTestWeb do
    pipe_through :api

    get "/rates/latest", RateController, :latest
    get "/rates/analyze", RateController, :analyze
    get "/rates/:date", RateController, :date
  end
end
