defmodule Sender do
  @moduledoc """
    Módulo que envía un mensaje al nodo receptor y espera la respuesta.
  """

  @doc """
    Inicia el nodo sender y se conecta al nodo receiver.
  """
  def start do
    # Inicia el nodo sender y se conecta al nodo receiver
    Node.start(:"sender@localhost", :shortnames)
    IO.puts("Nodo sender listo para enviar mensajes...")

    case Node.connect(:"receiver@localhost") do
      true ->
        IO.puts("Conexión exitosa con el nodo receiver.")
      false ->
        IO.puts("Error al conectar con el nodo receiver.")
        exit(:fallo_conexion)
    end

    # Envía un mensaje y espera la respuesta
    procesar_solicitud()
  end

  defp procesar_solicitud do
    mensaje = "Mensaje de solicitud desde el nodo sender."

    # En este caso, se usa Node.spawn_link/4 para enviar un mensaje al nodo receptor y esperar la respuesta.
    Node.spawn_link(:"receiver@localhost", Receiver, :procesar_mensaje, [self(), mensaje])

    # Espera la respuesta del nodo receptor
    receive do
      {:respuesta, response} ->
        IO.puts("Respuesta: #{response}")
        response
    after
      5000 ->
        IO.puts("Tiempo de espera agotado.")
        :timeout
    end
  end
end

Sender.start()
