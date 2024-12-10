defmodule MyAppWeb.DatabaseController do
  use MyAppWeb, :controller
  alias MyAppWeb.Repo

  def hello(conn, %{"name" => name}) do
    case Repo.get_user_by_name(name) do
      nil ->
        text(conn, "User not found")
      %{"name" => name, "age" => age} ->
        text(conn, "Hello, #{name}! You are #{age} years old.")
    end
  end

end
