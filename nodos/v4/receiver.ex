defmodule Receiver do
  @moduledoc """
    Módulo que recibe mensajes de un nodo remoto. En este caso, el nodo remoto es el nodo sender.
  """

  @doc """
    Inicia el nodo receiver y se conecta al nodo sender.
  """
  def start do
    # Inicia el nodo sender y se conecta al nodo receiver
    Node.start(:"receiver@localhost", :shortnames)
    IO.puts("Nodo receiver listo para recibir mensajes...")

    # Se registra el módulo Receiver en el nodo receiver
    :timer.sleep(:infinity)
  end

  @doc """
    Recibe un mensaje, lo procesa y retorna un resultado.
  """
  def procesar_mensaje(pid, mensaje) do
    # Procesa el mensaje y retorna un resultado
    respuesta = mensaje |> String.upcase()
    send(pid, {:respuesta, respuesta})
  end
end

Receiver.start()
