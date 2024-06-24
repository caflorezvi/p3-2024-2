Node.start(:"pong@localhost", :shortnames)
Node.set_cookie(:secret_cookie)

# Esperar a que el nodo Pong esté disponible
IO.puts("Iniciando el nodo Pong")

# Iniciar el servidor Pong
PongServer.start_link()

# Imprimir un mensaje en la consola
IO.puts("Esperando mensajes de Ping...")

# Dejar el proceso corriendo indefinidamente
Process.sleep(:infinity)
