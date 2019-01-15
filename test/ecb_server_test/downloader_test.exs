defmodule EcbServerTest.DownloaderTest do
  use ExUnit.Case

  alias EcbServerTest.Downloader

  @xml_uri "https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"
  @nonexistent_url "htttp://nothing.here"
  
  describe "get/1" do
    test "returns resource when given valid url" do
      response = Downloader.get(@xml_uri)
      assert response
    end

    test "returns `:nxdomain` when given nonexistent url" do
      response = Downloader.get(@nonexistent_url)
      assert response == :nxdomain
    end
  end
end