# Definir task2 para recibir mensajes
task2_pid = spawn(fn ->
  receive do
    {:mensaje, msg} ->
      IO.puts("Haz recibido este mensaje: #{msg}")
  end
end)

# Definir task1 para enviar un mensaje a task2
spawn(fn ->
  send(task2_pid, {:mensaje, "Hola, desde la tarea 1"})
end)

# Esperar a que task1 y task2 completen
Process.sleep(100)  # Pequeña pausa para asegurar que task2 tenga tiempo para recibir el mensaje

# Mostrar mensaje de completado
IO.puts("Todas las tareas han terminado")
