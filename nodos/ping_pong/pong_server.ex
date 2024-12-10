defmodule PongServer do
  @moduledoc """
    Este módulo se encarga de responder a un mensaje enviado por un nodo remoto.
  """
  use GenServer

  @doc """
    La función init/1 se encarga de iniciar el estado del proceso GenServer.
  """
  def start_link do
    # start_link/3 es una función de GenServer que inicia un proceso de GenServer
    # con el módulo actual, una lista de argumentos vacía y el nombre :pong_server
    GenServer.start_link(__MODULE__, [], name: :pong_server)
  end

  @doc """
    La función init/1 se encarga de iniciar el estado del proceso GenServer.
  """
  def init(_init_arg) do
    {:ok, %{pings: 0}}
  end

  @doc """
    La función handle_cast/2 se encarga de manejar los mensajes enviados al proceso GenServer.
    En este caso, se encarga de enviar un mensaje al proceso Ping.
  """
  def handle_cast({:ping, from_node}, state) do
    # Incrementa el número de pongs recibidos
    contador = state.pings + 1

    # Imprime un mensaje en la consola
    IO.puts("Pong: Recibido ping #{contador} desde #{from_node}")

    # Conecta el nodo actual con el nodo Ping (si están en redes diferentes)
    #Node.connect(from_node)

    # Envia un mensaje al proceso Ping
    GenServer.cast({:ping_server, from_node}, {:pong, Node.self()})

    # Retorna el nuevo estado del proceso GenServer
    {:noreply, %{state | pings: contador}}
  end

end
