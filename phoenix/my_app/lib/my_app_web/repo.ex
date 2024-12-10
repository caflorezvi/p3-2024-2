defmodule MyAppWeb.Repo do
  @moduledoc """
  Módulo para interactuar con la base de datos MongoDB.
  """

  def get_user_by_name(name) do
    Mongo.find_one(:mongo, "users", %{name: name})
  end
end
