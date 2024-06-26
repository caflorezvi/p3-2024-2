defmodule Receiver do
  @moduledoc """
    Módulo que recibe mensajes de un nodo remoto. En este caso, el nodo remoto es el nodo sender.
  """
  def iniciar do
    # Inicia el nodo receiver y se conecta al nodo sender
    Node.start(:"receiver@localhost", :shortnames)
    IO.puts "Nodo receiver listo para recibir llamadas..."

    # Espera a recibir mensajes
    :timer.sleep(:infinity)
  end

  @doc """
    Recibe un mensaje y lo imprime en la consola. En este caso, el mensaje es enviado por el nodo sender.
  """
  def recibir_mensaje(mensaje) do
    IO.puts "Mensaje recibido: #{mensaje}"
  end

  @doc """
    Calcula la suma de una lista de números y la imprime en la consola. En este caso, los números son enviados por el nodo sender.
  """
  def calcular_suma(lista) do
    suma = Enum.sum(lista)
    IO.puts "La suma de #{inspect(lista)} es #{suma}"
  end

  @doc """
    Actualiza el estado del nodo receiver. En este caso, el nuevo estado es enviado por el nodo sender.
  """
  def actualizar_estado(estado) do
    estado = %{estado | status: "inactivo", last_updated: DateTime.utc_now()}
    IO.puts "Estado actualizado: #{inspect(estado)}"
  end
end

Receiver.iniciar()
