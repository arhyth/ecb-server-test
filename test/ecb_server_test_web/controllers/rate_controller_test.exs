defmodule EcbAppWeb.RateControllerTest do
  use EcbAppWeb.ConnCase

  @valid_date "2018-12-12"

  describe "GET /rates/latest" do
    test "returns JSON response", %{conn: conn} do
      conn = get(conn, Routes.rate_path(conn, :latest))
      assert json_response(conn, 200)
    end
  end

  describe "GET /rates/:date" do
    test "returns JSON response", %{conn: conn} do
      conn = get(conn, Routes.rate_path(conn, :date, @valid_date))
      assert json_response(conn, 200)
    end
  end

  describe "GET /rates/analyze" do
    test "returns JSON response", %{conn: conn} do
      conn = get(conn, Routes.rate_path(conn, :analyze))
      assert json_response(conn, 200)
    end
  end
end