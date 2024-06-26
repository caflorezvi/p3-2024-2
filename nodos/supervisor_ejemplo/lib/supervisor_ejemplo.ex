defmodule SupervisorEjemplo do
  @moduledoc """
    Este módulo es el punto de entrada de la aplicación. Inicia el supervisor y envía un mensaje a un proceso.
  """
  use Application

  @impl true
  def start(_type, _args) do
    # Inicia el supervisor y obtiene el PID
    {:ok, pid} = ProcesoSupervisor.start_link([])

    # Envía un mensaje al proceso
    enviar_mensaje("Esta es una prueba!")

    # Espera un poco para que los mensajes se procesen
    :timer.sleep(1000)

    # Termina la aplicación
    System.stop(0)

    {:ok, pid}
  end

  @doc """
    Envia un mensaje al proceso. Se utiliza el supervisor para enviar el mensaje. GenServer.cast/2 se utiliza para enviar el mensaje al proceso.
  """
  def enviar_mensaje(mensaje) do
    GenServer.cast(Proceso1, {:enviar_mensaje, mensaje})
  end

end

# mix compile
# mix run --no-halt
