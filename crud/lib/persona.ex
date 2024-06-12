defmodule Persona do
  @moduledoc """
    Definición de la estructura Persona.
  """

  # Obliga a que la estructura tenga el campo :nombre
  @enforce_keys [:nombre]

  # Define una estructura con los campos :nombre y :edad
  defstruct [:nombre, :edad]
end
