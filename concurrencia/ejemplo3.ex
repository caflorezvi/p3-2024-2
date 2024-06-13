# Ejemplo de concurrencia con Elixir usando Task.async/1 y Task.await/2

# Crear una tarea que se ejecutará en paralelo
task1 = Task.async( fn ->
  Process.sleep(5000)
  IO.puts("Task 1 completed")
end )

task2 = Task.async( fn ->
  Process.sleep(1000)
  IO.puts("Task 2 completed")
end )

task3 = Task.async( fn ->
  Process.sleep(15000)
  IO.puts("Task 3 completed")
end )

# Esperar a que todas las tareas terminen
Task.await(task1, 20000)
Task.await(task2, 20000)
Task.await(task3, 20000)

IO.puts("All tasks completed")
