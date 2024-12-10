defmodule MyAppWeb.PageController do
  use MyAppWeb, :controller

  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def hello(conn, params) do
    name = Map.get(params, "name", "Guest") |> String.upcase()
    message = "Hello, #{name}!"
    text(conn, message)
  end

  def goodbye(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    text(conn, "Goodbye, world!")
  end

end
