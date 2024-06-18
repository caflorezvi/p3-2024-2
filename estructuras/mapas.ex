# Un mapa es una colección de pares clave-valor. Se puede utilizar para almacenar información de manera más organizada.
# Los mapas se crean utilizando llaves %{} y los pares clave-valor se separan por coma.
# Los mapas son colecciones de elementos desordenados y no permiten duplicados en las claves.
# Para acceder a los valores de un mapa se utiliza la notación de corchetes [] con la clave correspondiente o usando . y el nombre de la clave.

# Crear un nuevo mapa
mapa = %{ :nombre => "Juan", :edad => 30, :ciudad => "Armenia" }

# Imprimir el mapa
IO.inspect(mapa)

# Crear un nuevo mapa con notación de llaves
mapa2 = %{nombre: "María", edad: 25, ciudad: "Calarcá"}

# Imprimir el mapa
IO.inspect(mapa2)

# Acceder a los valores de un mapa
IO.puts("Nombre p1: #{mapa[:nombre]}")

# Acceder a los valores de un mapa con notación de llaves
IO.puts("Nombre p2: #{mapa2.nombre}")

IO.puts("--------------------")

# Actualizar un valor de un mapa
mapa_actualizado = %{mapa | edad: 31}

# Imprimir el mapa
IO.puts("Mapa actualizado:")
IO.inspect(mapa_actualizado)

IO.puts("--------------------")

# Hacer pattern matching con un mapa
%{nombre: nombre, edad: edad, ciudad: ciudad} = mapa
IO.puts("Pattern matching - Nombre: #{nombre}, Edad: #{edad}, Ciudad: #{ciudad}")

IO.puts("--------------------")

# Recorrer los campos de un mapa
Enum.each(mapa, fn {clave, valor} -> IO.puts("#{clave}: #{valor}") end)

# Mapa con frecuencia de marcas
marcas = %{"Chevrolet" => 10, "Renault" => 5, "Mazda" => 3}

IO.puts("--------------------")

# Imprimir la frecuencia de una marca
IO.puts("Frecuencia de Chevrolet: #{marcas["Chevrolet"]}")

IO.puts("--------------------")

# El auto con la frecuencia más alta
{auto_mas_vendido, _} = Enum.max_by(marcas, fn {_, frecuencia} -> frecuencia end)

IO.puts("Auto más vendido: #{auto_mas_vendido}")

IO.puts("--------------------")

# Usando el móduo Map para trabajar con mapas

# Crear un mapa con el móduo Map
mapa3 = Map.new(%{})

# Agregar un par clave-valor a un mapa con el móduo Map
mapa3 = Map.put(mapa3, :a, {"Carlos", "Ingeniero de sistemas y computación"}) # La clave No necesariamente debe ser un átomo, así mismo, el valor puede ser cualquier tipo de dato, no solo una tupla

# Imprimir el mapa
IO.puts("Mapa creado:")
IO.inspect(mapa3)

# Actualizar un valor de un mapa con el móduo Map
mapa3_actualizado = Map.update!(mapa3, :a, fn {_nombre, profesion} -> {"Carlos Andrés", profesion} end)

# Imprimir el mapa
IO.puts("Mapa actualizado:")
IO.inspect(mapa3_actualizado)

# Agregar un nuevo par clave-valor a un mapa con el móduo Map
mapa3_actualizado = Map.put(mapa3_actualizado, :b, {"Maria", "Médica"})
mapa3_actualizado = Map.put(mapa3_actualizado, :c, {"Jorge", "Investigador"})

# Imprimir el mapa
IO.puts("Mapa con la nueva clave :b y :c:")
IO.inspect(mapa3_actualizado)

# Eliminar un par clave-valor de un mapa con el móduo Map
mapa3_actualizado = Map.delete(mapa3_actualizado, :a)

# Imprimir el mapa
IO.puts("Mapa sin la clave :a:")
IO.inspect(mapa3_actualizado)

# Verificar si una clave existe en un mapa
IO.puts("La clave :a existe en el mapa3_actualizado: #{Map.has_key?(mapa3_actualizado, :a)}")

# Obtener todas las claves de un mapa
IO.puts("Todas las claves del mapa:")
IO.inspect(Map.keys(mapa3_actualizado))

# Obtener todos los valores de un mapa
IO.puts("Todos los valores del mapa que no tengan la clave :b:")
Enum.filter(mapa3_actualizado, fn {clave, _} -> clave != :b end) |> IO.inspect()

# Obtener el valor de una clave en un mapa
{nombre, profesion} = Map.get(mapa3_actualizado, :b)

# Imprimir el valor
IO.puts("Valor de la clave :b: #{nombre}, #{profesion}")
