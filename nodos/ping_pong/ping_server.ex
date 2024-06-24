defmodule PingServer do
  @moduledoc """
    Este módulo se encarga de enviar un mensaje a un nodo remoto
    y esperar una respuesta.
  """
  use GenServer

  @pong_node :"pong@localhost"

  @doc """
    Se crea un proceso GenServer con el nombre :ping_server
  """
  def start_link do
    # start_link/3 es una función de GenServer que inicia un proceso de GenServer
    # con el módulo actual, una lista de argumentos vacía y el nombre :ping_server
    GenServer.start_link(__MODULE__, [], name: :ping_server)
  end

  @doc """
    La función init/1 se encarga de iniciar el estado del proceso GenServer.
  """
  def init(_init_arg) do
    # Inicializa el estado del proceso GenServer con un mapa que contiene el número de pings enviados
    {:ok, %{pongs: 0}}
  end

  @doc """
    La función ping/0 se encarga de enviar un mensaje al proceso GenServer.
  """
  def ping do
    # Envia un mensaje al proceso GenServer
    GenServer.cast(:ping_server, :ping)
  end

  @doc """
    La función handle_cast/2 se encarga de manejar los mensajes enviados al proceso GenServer.
  """
  def handle_cast(:ping, state) do
    # En este caso, se encarga de enviar un mensaje al proceso Pong.

    # Imprime un mensaje en la consola
    IO.puts("Ping: Enviando ping a Pong")

    # Conecta el nodo actual con el nodo Pong
    Node.connect(@pong_node)

    # Envia un mensaje al proceso Pong
    GenServer.cast({:pong_server, @pong_node}, {:ping, Node.self()})

    # Retorna el estado del proceso GenServer
    {:noreply, state}
  end

  def handle_cast({:pong, from_node}, state) do
    # En este caso, se encarga de imprimir un mensaje en la consola cuando recibe un mensaje de Pong.

    # Incrementa el número de pings enviados
    contador = state.pongs + 1

    # Imprime un mensaje en la consola
    IO.puts("Ping: Recibido pong #{contador} desde #{from_node}")

    # Invoca la función ping/0 para enviar un nuevo mensaje a Pong, después de un segundo
    Process.sleep(1000)
    ping()

    # Retorna el nuevo estado del proceso GenServer
    {:noreply, %{state | pongs: contador}}
  end

end
