defmodule EcbAppWeb.RateView do
  @moduledoc false
  use EcbAppWeb, :view

  def render("date_rate.json", %{rates: rates}) do
    %{base: "EUR", rates: to_map(rates)}
  end

  def render("latest.json", %{latest: rates}) do
    %{base: "EUR", rates: to_map(rates)}
  end

  def render("analyze.json", %{analyze: rates}) do
    %{base: "EUR", rates_analyze: to_map(rates)}
  end

  # helper functions

  defp to_map(list) do
    Enum.reduce(list, %{}, fn {k, v}, acc ->
      Map.put(acc, k, v)
    end)
  end
end