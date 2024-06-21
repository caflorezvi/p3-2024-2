defmodule Proceso2 do
  @moduledoc """
    Este módulo es un proceso que recibe mensajes y los envía a otro proceso
  """

  # Importamos el módulo GenServer
  use GenServer

  @doc """
    Inicia el proceso Proceso2 y lo registra con el nombre Proceso2
  """
  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_cast({:mensaje_desde_proceso1, mensaje}, state) do
    IO.puts("Proceso2 ha recibido: #{mensaje} del Proceso1")
    # Enviamos el mensaje al Proceso1, se usa GenServer.cast porque no esperamos una respuesta.
    GenServer.cast(Proceso1, {:mensaje_desde_proceso2, "Respuesta a: #{mensaje}"})
    {:noreply, state}
  end

end
