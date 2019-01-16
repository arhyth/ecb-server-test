defmodule EcbServerTestWeb.RateView do
  @moduledoc false
  use EcbServerTestWeb, :view

  def render("date_rate.json", %{rate: rate}), do: render_rates(rate)
  def render("latest.json", %{latest: latest}), do: render_rates(latest)
  def render("analyze.json", %{analyze: analyze}), do: render_analyze(analyze)

  # helper functions

  defp render_rates(rates), do: %{base: "EUR", rates: rates}
  defp render_analyze(rates), do: %{base: "EUR", rates_analyze: rates}
end