defmodule EcbServerTestWeb.RateController do
  use EcbServerTestWeb, :controller

  alias EcbServerTest.EcbRates, as: ECB

  def latest(conn, _params) do
    with {:ok, rates} <- ECB.latest() do
      render(conn, "latest.json", latest: rates)
    end
  end

  def analyze(conn, _params) do
    with {:ok, rates} <- ECB.analyze() do
      render(conn, "analyze.json", analyze: rates)
    end
  end

  def date(conn, %{"date" => date}) do
    with {:ok, rates} <- ECB.date(date) do
      render(conn, "date_rate.json", rate: rates)
    end
  end
end
