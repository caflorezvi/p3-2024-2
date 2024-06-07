# Inicia el agente
Crud.start_link([])

# Crear personas
Crud.crear_persona("123", "Alice", 30)
Crud.crear_persona("456", "Bob", 25)
Crud.crear_persona("678", "Carlos", 30)

# Leer todas las personas
IO.inspect(Crud.leer_personas())

# Actualizar una persona por ID
Crud.actualizar_persona("123", "Alice", 31)

# Leer todas las personas
IO.inspect(Crud.leer_personas())

# Eliminar una persona por ID
Crud.eliminar_persona("123")

# Leer todas las personas
IO.inspect(Crud.leer_personas())
