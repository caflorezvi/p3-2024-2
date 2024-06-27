defmodule AplicacionCrud do
  @moduledoc """
    Módulo principal de la aplicación. Inicia el agente y realiza operaciones CRUD.
  """

  # Application es un módulo de Elixir que se utiliza para definir la aplicación principal.
  use Application

  @impl true
  def start(_type, _args) do

    # Inicia el agente
    {:ok, _pid} = CrudInterface.iniciar()

    # Crear personas
    CrudInterface.crear("123", "Alice", 30)
    CrudInterface.crear("456", "Bob", 25)
    CrudInterface.crear("678", "Carlos", 30)

    # Crear una persona con un ID inexistente
    IO.inspect(CrudInterface.crear("123", "Juanita", 21))

    # Leer todas las personas
    IO.inspect(CrudInterface.listar(), label: "Personas después de la creación")

    # Actualizar una persona por ID
    CrudInterface.actualizar("123", "Alice", 31)

    # Leer todas las personas
    IO.inspect(CrudInterface.listar(), label: "Personas después de la actualización")

    # Eliminar una persona por ID
    CrudInterface.eliminar("123")

    # Eliminar una persona con un ID inexistente
    IO.inspect(CrudInterface.eliminar("1234"))

    # Leer todas las personas
    IO.inspect(CrudInterface.listar(), label: "Personas después de la eliminación")

    {:ok, self()}
  end

end

# mix compile
# mix run --no-halt
