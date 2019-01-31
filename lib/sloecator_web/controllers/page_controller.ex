defmodule SloecatorWeb.PageController do
  use SloecatorWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
