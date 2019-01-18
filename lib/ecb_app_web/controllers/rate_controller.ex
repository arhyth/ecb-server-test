defmodule EcbAppWeb.RateController do
  use EcbAppWeb, :controller

  def latest(conn, _params) do
    rates = EcbApp.get_latest()
    render(conn, "latest.json", latest: rates)
  end

  def analyze(conn, _params) do
    rates = EcbApp.analyze_rates()
    render(conn, "analyze.json", analyze: rates)
  end

  def date(conn, %{"date" => date}) do
    rates = EcbApp.get_rates(%{date: date})
    render(conn, "date_rate.json", rates: rates)
  end
end
