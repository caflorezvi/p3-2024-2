defmodule ProcesoSupervisor do
  @moduledoc """
    Este módulo es un supervisor que se encarga de iniciar los procesos
  """

  # Importamos el módulo Supervisor
  use Supervisor

  @doc """
    Inicia el supervisor
  """
  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @doc """
    Inicia los procesos hijos. En este caso, Proceso1 y Proceso2.
  """
  @impl true
  def init(_init_arg) do
    children = [
      {Proceso1, []},
      {Proceso2, []}
    ]

    # Iniciamos los procesos hijos con la estrategia one_for_one, que significa que si un proceso falla, solo ese proceso será reiniciado.
    Supervisor.init(children, strategy: :one_for_one)
  end

end
