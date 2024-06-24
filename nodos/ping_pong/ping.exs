defmodule Ping do
  @moduledoc """
    Este módulo se encarga de enviar un mensaje a un nodo remoto
    y esperar una respuesta.
  """

  @doc """
    Inicia el nodo ping y se conecta al nodo pong.
  """
  def iniciar do

    # Inicia el nodo ping con el nombre ping@localhost
    Node.start(:"ping@localhost", :shortnames)
    # Establece la cookie secreta
    Node.set_cookie(:scret_cookie)

    # Imprime un mensaje en pantalla
    IO.puts("Nodo ping iniciado")

    # Intenta conectarse al nodo pong y si lo logra, inicia la comunicación
    case Node.connect(:"pong@localhost") do
      true ->
        IO.puts("Conectado a pong")
        enviar()
      false -> IO.puts("No se pudo conectar a pong")
    end

  end

  defp enviar do
    # Envía un mensaje al nodo pong, con el mensaje :ping y la dirección del proceso actual
    send({:recibir, :"pong@localhost"}, {:ping, self()})
    # Espera una respuesta del nodo pong
    receive do
      {:pong, _pid} ->
        # Si recibe el mensaje :pong, imprime "Ping" en pantalla
        IO.puts("Ping")
        # Espera 1 segundo antes de enviar otro mensaje
        :timer.sleep(1000)
    end
    # Llama a la función enviar() de nuevo
    enviar()
  end

end

Ping.iniciar()
