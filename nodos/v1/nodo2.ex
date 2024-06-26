defmodule Nodo2 do
  @moduledoc """
    Nodo 2 recibe un mensaje enviado por el nodo 1 usando Node. Node es un módulo que permite la comunicación entre nodos en Elixir.
    Un nodo en Elixir es una instancia de la máquina virtual de Elixir que se puede comunicar con otros nodos.
  """

  @doc """
      Iniciar nodo 2 y recibir mensaje del nodo 1
  """
  def iniciar do
    # Iniciar nodo 2 con nombre nodo2@localhost y habilitar shortnames. nodo2 es el nombre del nodo y localhost es el dominio.
    Node.start(:nodo2@localhost, :shortnames)

    # Establecer cookie de nodo. La cookie de nodo es una cadena de texto que se comparte entre nodos para permitir la comunicación.
    Node.set_cookie(:secretcookie)

    # Se usa spawn_link para iniciar un proceso que recibe mensajes
    spawn_link(fn -> recibir_mensajes() end)

    # Se mantiene el proceso actual en ejecución
    :timer.sleep(:infinity)

  end

  defp recibir_mensajes do
    # Se registra el proceso actual con el nombre :recibir
    Process.register(self(), :recibir)
    # Se llama a la función leer_mensaje para recibir mensajes
    leer_mensaje()
  end

  defp leer_mensaje do
    receive do
      {:mensaje, texto} ->
        IO.puts "Mensaje recibido en el nodo 2: #{texto}"
        leer_mensaje()
    end
  end

end

Nodo2.iniciar()
