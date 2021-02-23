defmodule DeliverRxWeb.PageController do
  use DeliverRxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
