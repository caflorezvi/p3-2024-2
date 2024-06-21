defmodule Sender do
  @moduledoc """
    Módulo que representa un nodo emisor de mensajes. Este módulo se encarga de enviar mensajes a los nodos receptores.
  """

  @doc """
    Inicia el nodo emisor. Este método inicia el nodo emisor y se encarga de enviar mensajes a los nodos receptores.
  """
  def iniciar do
    # Se inicia el nodo emisor y se conecta al nodo receptor
    Node.start(:sender@localhost, :shortnames)
    Node.connect(:receiver@localhost)

    # Se envían mensajes a los procesos 1 y 2
    enviar_mensaje_1()
    enviar_mensaje_2()
  end

  defp enviar_mensaje_1 do
    num1 = 5
    num2 = 10
    send({:proceso1, :receiver@localhost}, {self(), {num1, num2}})
    IO.puts("Mensaje enviado al proceso 1")
    recibir_respuesta()
  end

  defp enviar_mensaje_2 do
    mensaje = "Este mensaje se envía al proceso 2"
    send({:proceso2, :receiver@localhost}, {self(), {mensaje}})
    IO.puts("Mensaje enviado al proceso 2")
    recibir_respuesta()
  end

  defp recibir_respuesta do
    receive do
      {:respuesta, mensaje} ->
        IO.puts("Respuesta recibida: #{mensaje}")
    end
  end

end

Sender.iniciar()
