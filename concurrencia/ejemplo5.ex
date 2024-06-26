defmodule EjemploComunicacion do
  @moduledoc """
    Ejemplo de comunicación entre procesos en Elixir usando send y receive
  """

  @doc """
    Proceso 1 recibe un mensaje
  """
  def proceso1 do
    receive do
      {:mensaje, msg} ->
        IO.puts "Proceso 1 recibió el mensaje: #{msg}"
    end
  end

  @doc """
    Proceso 2 envía un mensaje a proceso 1
  """
  def proceso2(pid) do
    send(pid, {:mensaje, "Hola desde proceso 2"})
  end

  @doc """
    Iniciar procesos 1 y 2
  """
  def iniciar do
    # Iniciar proceso 1
    task1 = Task.async(fn -> proceso1() end)
    # Iniciar proceso 2 y enviar pid de proceso 1
    task2 = Task.async(fn -> proceso2(task1.pid) end)

    # Esperar a que ambos procesos terminen
    Task.await(task1)
    Task.await(task2)
  end
end

EjemploComunicacion.iniciar()
