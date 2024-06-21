# sender.ex
defmodule Sender do
  @moduledoc """
    Módulo que envía mensajes a un nodo remoto. En este caso, el nodo remoto es el nodo receiver.
  """
  def iniciar do
    # Inicia el nodo sender y se conecta al nodo receiver
    Node.start(:"sender@localhost", :shortnames)
    IO.puts("Nodo sender listo para enviar mensajes...")

    Node.connect(:"receiver@localhost")

    # Envía un mensaje, realiza un cálculo y actualiza el estado del nodo receiver
    enviar_mensaje()
    realizar_calculo()
    actualizar_estado()
  end

  defp enviar_mensaje do
    mensaje = "¡Hola desde el nodo sender!"
    # Se usa Node.spawn/4 para enviar un mensaje al nodo receiver. Node.spawn/4 recibe el nombre del nodo remoto, el módulo y la función a ejecutar, y los argumentos de la función. Sirve para enviar mensajes a un nodo remoto y ejecutar funciones en él.
    Node.spawn(:"receiver@localhost", Receiver, :recibir_mensaje, [mensaje])
  end

  defp realizar_calculo do
    lista = [1, 2, 3, 4, 5]
    Node.spawn(:"receiver@localhost", Receiver, :calcular_suma, [lista])
  end

  defp actualizar_estado do
    estado = %{status: "activos", last_updated: DateTime.utc_now()}
    Node.spawn(:"receiver@localhost", Receiver, :actualizar_estado, [estado])
  end
end

Sender.iniciar()
