defmodule Nodo1 do
  @moduledoc """
    Nodo 1 envía un mensaje al nodo 2 usando Node. Node es un módulo que permite la comunicación entre nodos en Elixir.
    Un nodo en Elixir es una instancia de la máquina virtual de Elixir que se puede comunicar con otros nodos.
  """

  @doc """
      Iniciar nodo 1 y enviar mensaje al nodo 2
  """
  def iniciar do
    # Iniciar nodo 1 con nombre nodo1@localhost y habilitar shortnames. Shortnames permite usar nombres de nodo sin el dominio.
    Node.start(:nodo1@localhost, :shortnames)
    # Establecer cookie de nodo. La cookie de nodo es una cadena de texto que se comparte entre nodos para permitir la comunicación.
    Node.set_cookie(:secretcookie)

    # Conectar nodo 1 con nodo 2 usando la dirección del nodo 2.
    Node.connect(:'nodo2@localhost')

    # Envía un mensaje al nodo 2
    enviar_mensaje()

  end

  defp enviar_mensaje do
    texto = "Escribe un mensaje para enviar al otro nodo: " |> IO.gets() |> String.trim()
    send({:recibir, :'nodo2@localhost'}, {:mensaje, texto})
  end

end

Nodo1.iniciar()
