defmodule EcbApp.EcbTest do
  use EcbApp.DataCase

  alias EcbApp.Rate

  @currency_params %{symbol: "EURO"}
  @rate_params %{date: "2019-07-09", value: Decimal.from_float(1.2345)}

  describe "create_currency/1" do
    test "returns currency with symbol" do
      assert {:ok, currency} = EcbApp.create_currency(@currency_params)
      assert Map.get(currency, :symbol) == @currency_params[:symbol]
    end

    test "returns error changeset when currency with same symbol exists" do
      EcbApp.create_currency(@currency_params)
      assert {:error, ch} = EcbApp.create_currency(@currency_params)
      refute ch.valid?
      assert Enum.any?(ch.errors, fn {field, {error, _}} ->
        field == :symbol && error == "has already been taken"
      end)
    end
  end

  describe "create_rate/1" do
    setup do
      {:ok, currency} = EcbApp.create_currency(@currency_params)
      %{currency: currency}
    end

    test "returns rate with date, value, currency", %{currency: c} do
      params = Map.put(@rate_params, :currency_id, c.id)
      {:ok, rate} = EcbApp.create_rate(%Rate{}, params)
      rate = EcbApp.get_rate(rate.id, [:currency])
      
      assert date = Map.get(rate, :date)
      assert Date.to_iso8601(date)== @rate_params[:date]
      assert Map.get(rate, :value)== @rate_params[:value]
      assert rate.currency.symbol == c.symbol
    end
  end
end