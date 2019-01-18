defmodule EuroSeeder do
  alias EcbApp.{
    Downloader,
    Rate,
  }

  require Xmler

  @xml_uri "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"

  def seed do
    %{xml_path: @xml_uri}
    |> download()
    |> parse()
    |> Xmler.path_string('/gesmes:Envelope/Cube/Cube')
    |> to_date_rates_tuples()
    |> flat_map_to_currency_rates()
    |> group_and_insert()
  end

  defp download(%{xml_path: path} = attrs) do
    raw_xml = Downloader.get(path)
    Map.put(attrs, :raw_xml, raw_xml)
  end

  defp parse(%{raw_xml: raw_xml}) do
    {doc, _} =
      raw_xml
      |> :binary.bin_to_list()
      |> :xmerl_scan.string()
    doc
  end

  defp to_date_rates_tuples(elements) do
    Enum.map(elements, fn e ->
      [date_elem] = get_attributes(e)
      date = get_content(date_elem)
      rates_elems = get_content(e)

      {date, Enum.map(rates_elems, &extract_currency_rate/1)}
    end)
  end

  defp extract_currency_rate(rates_elem) do
    [currency: c, rate: r] = get_attribute_keyvalues(rates_elem)
    {c, r}
  end

  defp flat_map_to_currency_rates(date_currency_rates) do
    Enum.flat_map(date_currency_rates, fn {date, currency_rates} ->
      date =
        date
        |> to_string()
        |> Date.from_iso8601!()

      Enum.map(currency_rates, fn {currency, rate} ->
        rate =
          rate
          |> to_string()
          |> Decimal.new()

        {to_string(currency), %Rate{date: date, value: rate}}
      end)
    end)
  end

  defp group_and_insert(currency_rates) do
    map =
      Enum.group_by(
        currency_rates,
        fn {c, _r} -> c end,
        fn {_c, r} -> r end
      )

    Enum.each(map, fn {symbol, rates} -> 
      {:ok, currency} = EcbApp.create_currency(%{symbol: symbol})
      Enum.each(rates, fn r ->
        EcbApp.create_rate(%{r | currency_id: currency.id})
      end)
    end)
  end

  defp get_attributes(node), do: Xmler.xmlElement(node, :attributes)
  defp get_content(node), do: Xmler.xmlElement(node, :content)
  defp get_attribute_keyvalues(node) do
    node
    |> Xmler.xmlElement(:attributes)
    |> Enum.map(fn a ->
      {Xmler.xmlAttribute(a, :name), Xmler.xmlAttribute(a, :value)}
    end)
  end
end