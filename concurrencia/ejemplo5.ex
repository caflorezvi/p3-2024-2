defmodule EjemploComunicacion do
  def proceso1 do
    receive do
      {:mensaje, msg} ->
        IO.puts "Proceso 1 recibió el mensaje: #{msg}"
    end
  end

  def proceso2(pid) do
    send(pid, {:mensaje, "Hola desde proceso 2"})
  end

  def iniciar do
    task1 = Task.async(fn -> proceso1() end)
    task2 = Task.async(fn -> proceso2(task1.pid) end)

    Task.await(task1)
    Task.await(task2)
  end
end

EjemploComunicacion.iniciar()
