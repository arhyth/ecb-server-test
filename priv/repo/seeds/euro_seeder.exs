defmodule EuroSeeder do
  alias EcbServerTest.Downloader

  @xml_uri "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"

  def seed do
    %{xml_path: @xml_uri}
    |> download()
    |> parse()
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
end