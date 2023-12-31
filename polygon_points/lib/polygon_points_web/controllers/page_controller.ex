defmodule PolygonPointsWeb.PageController do
  use PolygonPointsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
