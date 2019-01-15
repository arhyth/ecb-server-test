defmodule EcbServerTestWeb.RateControllerTest do
  use EcbServerTestWeb.ConnCase

  describe "GET /rates/latest" do
    test "returns latest rates in JSON and in ascending order" do
    end
  end

  describe "GET /rates/:date" do
    test "returns rates at date in JSON and in ascending order" do
    end
  end

  describe "GET /rates/analyze" do
    test "returns max, min, and average exchange rates" do
    end
  end
end