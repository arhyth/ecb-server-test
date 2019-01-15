defmodule EcbServerTestWeb.PageController do
  use EcbServerTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
