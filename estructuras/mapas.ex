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
