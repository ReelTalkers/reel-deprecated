defmodule Reel.PageController do
  use Reel.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
