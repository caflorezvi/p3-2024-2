# Inicia el agente
CrudInterface.iniciar()

# Crear personas
CrudInterface.crear("123", "Alice", 30)
CrudInterface.crear("456", "Bob", 25)
CrudInterface.crear("678", "Carlos", 30)

# Leer todas las personas
IO.inspect(CrudInterface.listar(), label: "Personas después de la creación")

# Actualizar una persona por ID
CrudInterface.actualizar("123", "Alice", 31)

# Leer todas las personas
IO.inspect(CrudInterface.listar(), label: "Personas después de la actualización")

# Eliminar una persona por ID
CrudInterface.eliminar("123")

# Leer todas las personas
IO.inspect(CrudInterface.listar(), label: "Personas después de la eliminación")
