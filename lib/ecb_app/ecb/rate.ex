defmodule EcbApp.Rate do
  @moduledoc """
  Rate schema
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias EcbApp.{
    Currency,
    Rate
  }

  @attrs [:date, :value, :currency_id]

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
  end
end