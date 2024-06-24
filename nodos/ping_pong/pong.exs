defmodule Pong do
  @moduledoc """
    Este módulo se encarga de responder a un mensaje enviado por un nodo remoto.
  """

  @doc """
    Inicia el nodo pong y se queda esperando un mensaje.
  """
  def iniciar do
    # Inicia el nodo pong con el nombre pong@localhost
    Node.start(:"pong@localhost", :shortnames)
    # Establece la cookie secreta
    Node.set_cookie(:scret_cookie)

    # Imprime un mensaje en pantalla
    IO.puts("Nodo pong iniciado")

    # Registra el proceso actual para recibir mensajes
    Process.register(self(), :recibir)

    # Inicia el bucle de espera de mensajes
    loop()

  end

  defp loop do
    # Espera un mensaje con el formato {:ping, pid}
    receive do
      {:ping, pid} ->
        # Si recibe el mensaje :ping, imprime "Pong" en pantalla
        IO.puts("Pong")
        # Envía un mensaje al nodo ping, con el mensaje :pong y la dirección del proceso actual
        send(pid, {:pong, self()})
    end
    # Llama a la función loop() de nuevo
    loop()
  end

end

Pong.iniciar()
