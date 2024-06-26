# Una tupla es una colección de elementos ordenados e inmutables.
# A diferencia de las listas, las tuplas no pueden ser modificadas una vez creadas.
# Las tuplas se crean utilizando llaves {} y los elementos se separan por coma.

# Se crea una tupla con diferentes tipos de datos
tupla = {1, "hola", :mundo, 3.14}

# Se imprime la tupla
IO.inspect(tupla)

# Se obtiene el primer elemento de la tupla
IO.puts("Primer elemento: #{elem(tupla, 0)}")

# Se hace pattern matching con la tupla
{numero_entero, cadena, _atomo, _numero_decimal} = tupla

# Se imprime el valor de las variables
IO.puts("Número entero: #{numero_entero}")
IO.puts("Cadena: #{cadena}")
