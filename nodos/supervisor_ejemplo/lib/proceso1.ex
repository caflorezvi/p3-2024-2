defmodule Proceso1 do
  @moduledoc """
    Este módulo es un proceso que recibe mensajes y los envía a otro proceso
  """

  # Importamos el módulo GenServer
  use GenServer

  @doc """
    Inicia el proceso Proceso1 y lo registra con el nombre Proceso1
  """
  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_cast({:enviar_mensaje, mensaje}, state) do
    IO.puts("Proceso1 ha recibido: #{mensaje}")
    # Enviamos el mensaje al Proceso2, se usa GenServer.cast porque no esperamos una respuesta
    GenServer.cast(Proceso2, {:mensaje_desde_proceso1, mensaje})
    # Retornamos el estado actual del proceso
    {:noreply, state}
  end

  @impl true
  def handle_cast({:mensaje_desde_proceso2, mensaje}, state) do
    IO.puts("Proceso1 ha recibido: #{mensaje} del Proceso2")
    {:noreply, state}
  end

end
