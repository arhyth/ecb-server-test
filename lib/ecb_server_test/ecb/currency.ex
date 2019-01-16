defmodule EcbServerTest.Currency do
  @moduledoc """
  Currency schema
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias EcbServerTest.Currency
  alias EcbServerTest.Rate

  @attrs [:symbol]

  schema "currencies" do
    field :symbol, :string, unique: true
    has_many :rates, Rate

    timestamps()
  end

  def changeset(%Currency{} = currency, attrs \\ %{}) do
    currency
    |> cast(attrs, @attrs)
    |> validate_required(@attrs)
    |> unique_constraint(:symbol)
  end
end