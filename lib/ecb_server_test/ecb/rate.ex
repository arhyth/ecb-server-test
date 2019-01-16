defmodule EcbServerTest.Rate do
  @moduledoc """
  Rate schema
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias EcbServerTest.{
    Currency,
    Rate
  }

  @attrs [:date, :value]

  schema "rates" do
    field :date, :date
    field :value, :decimal

    belongs_to :currency, Currency

    timestamps()
  end

  def changeset(%Rate{} = rate, attrs \\ %{}) do
    rate
    |> cast(attrs, @attrs)
    |> validate_required(@attrs)
    |> unique_constraint(:date_currency)
  end
end