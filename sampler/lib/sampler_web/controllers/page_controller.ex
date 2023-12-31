defmodule SamplerWeb.PageController do
  use SamplerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
