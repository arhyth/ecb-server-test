defmodule EcbApp.Downloader do
  @moduledoc """
  ECB client module
  """
  
  def get(url) when is_binary(url) do
    url
    |> HTTPoison.get()
    |> case do
      {:ok, %{body: body}} -> body
      {:error, %{reason: reason}} -> reason
    end
  end
end