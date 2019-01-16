defmodule EcbServerTest.EcbRates do
  @moduledoc """
  Domain layer API of the ECB service
  """

  def date(date) when is_binary(date) do
    {:ok, %{
          "AUD": 1.5339,
          "BGN": 1.9558,
          "USD": 1.2023,
          "ZAR": 14.8845
    }}
  end

  def latest do
    {:ok, %{
      "AUD": 1.5339,
      "BGN": 1.9558,
      "USD": 1.2023,
      "ZAR": 14.8845
    }}
  end

  def analyze do
    {:ok, %{
      "AUD": 1.500000339,
      "BGN": 1.900000558,
      "USD": 1.200000023,
      "ZAR": 14.800000845
    }}
  end
end