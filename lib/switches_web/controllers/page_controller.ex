defmodule SwitchesWeb.PageController do
  use SwitchesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
