# Una lista es una colección de elementos ordenados y mutables.
# Las listas se crean utilizando corchetes [] y los elementos se separan por coma.
# A diferencia de las tuplas, las listas pueden ser modificadas una vez creadas.

# Crear una nueva lista
lista = [1, 2, 3, 4, 5]

# Imprimir la lista
IO.inspect(lista)

IO.puts("--------------------")

# Agregar un nuevo elemento a la lista
lista2 = [71 | lista]

# Imprimir la lista
IO.inspect(lista2)

IO.puts("--------------------")

# Agregar un nuevo elemento a la lista
lista3 = lista ++ [72]

# Imprimir la lista
IO.inspect(lista3)

IO.puts("--------------------")

# Obtener el primer elemento de la lista
IO.puts("Primer elemento: #{hd(lista)}")

# Obtener la cola de la lista
IO.puts("Cola de la lista:")
IO.inspect(tl(lista))

IO.puts("--------------------")

# Modificar un elemento de la lista
lista_modificada = List.replace_at(lista, 2, 10)

# Imprimir la lista modificada
IO.puts("Lista modificada:")
IO.inspect(lista_modificada)

IO.puts("--------------------")

# Eliminar un elemento de la lista
lista_eliminada = List.delete_at(lista, 2)

# Imprimir la lista eliminada
IO.puts("Lista eliminada:")
IO.inspect(lista_eliminada)

IO.puts("--------------------")

# Hacer pattern matching con la lista
[primer_elemento | resto_lista] = lista

# Imprimir el valor de las variables
IO.puts("Primer elemento: #{primer_elemento}")

IO.puts("Resto de la lista:")
IO.inspect(resto_lista)

IO.puts("--------------------")

# Hacer pattern matching con la lista
[primer_elemento, segundo_elemento | resto_lista] = lista

# Imprimir el valor de las variables
IO.puts("Primer elemento: #{primer_elemento}")
IO.puts("Segundo elemento: #{segundo_elemento}")

IO.puts("Resto de la lista:")
IO.inspect(resto_lista)

IO.puts("--------------------")

# Imprimir la lista elemento por elemento
Enum.each(lista, fn x -> IO.puts(x) end)

IO.puts("--------------------")

# Imprimir la lista elemento por elemento utilizando un for
for x <- lista do
  IO.puts(x)
end

IO.puts("--------------------")

# Usando diferentes funciones del módulo Enum

# Obtener el índice de un elemento en la lista
IO.puts("Indice del elemento 3: #{Enum.find_index(lista, &(&1 == 3))}")

# Obtener la longitud de la lista
IO.puts("Longitud de la lista con enum: #{Enum.count(lista)}")
IO.puts("Longitud de la lista: #{length(lista)}")

# Obtener el primer elemento de la lista
IO.puts("Primer elemento: #{Enum.at(lista, 0)}")

# Obtener el último elemento de la lista
IO.puts("Último elemento: #{Enum.at(lista, -1)}")

# Buscar un elemento en la lista
IO.puts("Buscar el elemento 3: #{Enum.member?(lista, 3)}")

# Usando map para multiplicar por 2 cada elemento de la lista
lista4 = Enum.map(lista, fn x -> x * 2 end)

# Imprimir la lista
IO.puts("Multiplicar por 2 cada elemento de la lista:")
IO.inspect(lista4)

# Usando filter para obtener los elementos mayores a 3
lista5 = Enum.filter(lista, fn x -> x > 3 end)

# Imprimir la lista
IO.puts("Elementos mayores a 3 de la lista:")
IO.inspect(lista5)

# Usando map para obtener el cuadrado de cada elemento de la lista, pero solo para los elementos pares
lista6 = Enum.filter(lista, &(rem(&1, 2) == 0)) |> Enum.map(fn x -> x * x end )

# Imprimir la lista
IO.puts("Cuadrado de los elementos pares de la lista:")
IO.inspect(lista6)

# Usando reduce para sumar todos los elementos de la lista
suma = Enum.reduce(lista, 0, fn x, acc -> x + acc end)

# Imprimir la suma
IO.puts("Suma de los elementos de la lista: #{suma}")

# Usando reduce para sumar todos los elementos de la lista, pero solo para los elementos mayores a 3
suma2 = Enum.reduce(lista, 0, fn x, acc -> if x > 3, do: x + acc, else: acc end)

# Imprimir la suma
IO.puts("Suma de los elementos mayores a 3 de la lista: #{suma2}")

IO.puts("--------------------")

lista = ["hola", "mundo", "elixir", "es", "genial"]

# Obtener la cadena más larga de la lista
cadena_mas_larga = Enum.max_by(lista, &String.length/1)

# Imprimir la cadena más larga
IO.puts("Cadena más larga: #{cadena_mas_larga}")

# Ordenar la lista alfabéticamente
lista_ordenada = Enum.sort(lista)

# Imprimir la lista ordenada
IO.puts("Lista ordenada:")
IO.inspect(lista_ordenada)

# Concatenar todos los elementos de la lista
cadena_concatenada = Enum.join(lista, " - ")

# Imprimir la cadena concatenada
IO.puts("Cadena concatenada: #{cadena_concatenada}")

# Revertir la lista
lista_revertida = Enum.reverse(lista)

# Imprimir la lista revertida
IO.puts("Lista revertida:")
IO.inspect(lista_revertida)

IO.puts("--------------------")

# Dividir la lista en dos partes
{lista1, lista2} = Enum.split(lista, 2)

# Imprimir las listas
IO.puts("Lista 1:")
IO.inspect(lista1)

IO.puts("Lista 2:")
IO.inspect(lista2)

IO.puts("--------------------")

# Crear una lista de listas
lista_de_listas = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

# Imprimir la lista de listas
IO.inspect(lista_de_listas)
