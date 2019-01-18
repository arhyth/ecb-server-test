defmodule EcbApp do
  @moduledoc """
  ECB App Context / Domain
  """

  alias EcbApp.{
    Currency,
    Rate,
    Repo
  }

  import Ecto.Query

  def get_rates(%{date: date}) do
    Repo.all(from(
      r in Rate,
      join: c in Currency,
      on: r.currency_id == c.id,
      where: r.date == ^date,
      select: {c.symbol, r.value}
    ))
  end

  def get_latest do 
    Repo.all(from(
      r in Rate,
      join: c in Currency,
      where: r.currency_id == c.id,
      order_by: [desc: r.date],
      distinct: c.symbol,
      group_by: [c.symbol, r.value, r.id],
      select: {c.symbol, r.value}
    ))
  end

  def analyze_rates do
    Repo.all(from(
      r in Rate,
      join: c in Currency,
      where: r.currency_id == c.id,
      order_by: [asc: c.symbol],
      group_by: c.symbol,
      select: {
        c.symbol, %{
          max: max(r.value), 
          min: min(r.value), 
          avg: avg(r.value)
      }}
    ))
  end

  def create_rate(rate \\ %Rate{}, params \\ %{}) do
    rate
    |> Rate.changeset(params)
    |> Repo.insert()
  end

  def get_rate(id, preloads \\ []) do
    Rate
    |> where(id: ^id)
    |> preload(^preloads)
    |> Repo.one()
  end

  def create_currency(params \\ %{}) do
    %Currency{}
    |> Currency.changeset(params)
    |> Repo.insert()
  end
end