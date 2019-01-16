defmodule EcbServerTestWeb.RateControllerTest do
  use EcbServerTestWeb.ConnCase

  @valid_date "2019-01-01"

  describe "GET /rates/latest" do
    test "returns latest rates in JSON and in ascending order", %{conn: conn} do
      conn = get(conn, Routes.rate_path(conn, :latest))
      assert json_response(conn, 200)
    end
  end

  describe "GET /rates/:date" do
    test "returns rates at date in JSON", %{conn: conn} do
      conn = get(conn, Routes.rate_path(conn, :date, @valid_date))
      assert json_response(conn, 200)
    end
  end

  describe "GET /rates/analyze" do
    test "returns max, min, and average exchange rates in JSON", %{conn: conn} do
      conn = get(conn, Routes.rate_path(conn, :analyze))
      assert json_response(conn, 200)
    end
  end
end