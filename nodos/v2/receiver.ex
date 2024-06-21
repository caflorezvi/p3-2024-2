defmodule Receiver do
  @moduledoc """
    Módulo que representa un nodo receptor de mensajes. Este módulo se encarga de recibir mensajes y responder a los mismos.
  """

  @doc """
    Inicia el nodo receptor. Este método inicia el nodo receptor y se encarga de recibir mensajes.
  """
  def iniciar do
    # Se inicia el nodo receptor
    Node.start(:receiver@localhost, :shortnames)
    IO.puts("Nodo receptor iniciado...")
    recibir_mensajes()

    # Se mantiene el proceso receptor en ejecución
    :timer.sleep(:infinity)
  end

  defp recibir_mensajes do
    # Se inician los procesos 1 y 2
    spawn(fn -> proceso1() end)
    spawn(fn -> proceso2() end)
  end

  defp proceso1 do
    # Registra el proceso 1 con el nombre :proceso1
    Process.register(self(), :proceso1)
    IO.puts "Proceso 1 esperando mensajes..."

    # Ejecuta la función correspondiente al proceso 1
    recibir_mensaje(&sumar/1)
  end

  defp proceso2 do
    # Registra el proceso 2 con el nombre :proceso2
    Process.register(self(), :proceso2)
    IO.puts "Proceso 2 esperando mensajes..."

    # Ejecuta la función correspondiente al proceso 2
    recibir_mensaje(&imprimir/1)
  end

  defp recibir_mensaje(funcion) do
    # Recibe un mensaje y ejecuta la función correspondiente a ese mensaje
    receive do
      {sender, tupla} ->
        respuesta = funcion.(tupla)
        send(sender, {:respuesta, respuesta})
    end
    recibir_mensaje(funcion)
  end

  defp sumar({num1, num2}) do
    IO.puts("Proceso 1 recibió el mensaje: #{num1} + #{num2}")
    num1 + num2
  end

  defp imprimir({mensaje}) do
    IO.puts("Proceso 2 recibió el mensaje: #{mensaje}")
    mensaje |> String.upcase()
  end

end

Receiver.iniciar()
