defmodule EcbApp.Currency do
  @moduledoc """
  Currency schema
  """
  use Ecto.Schema

  import Ecto.Changeset

  alias EcbApp.Currency
  alias EcbApp.Rate

  @attrs [:symbol]

  schema "currencies" do
    field :symbol, :string
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