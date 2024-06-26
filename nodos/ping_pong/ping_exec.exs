Node.start(:"ping@localhost", :shortnames)
Node.set_cookie(:secret_cookie)

# Esperar a que el nodo Pong esté disponible
IO.puts("Iniciando el nodo Ping")

# Iniciar el servidor Ping y enviar un mensaje al servidor Pong
PingServer.start_link()
PingServer.ping()

# Dejar el proceso corriendo indefinidamente
Process.sleep(:infinity)
