# La lista de tuplas es una estructura de datos que se puede utilizar para almacenar datos de manera ordenada.
# Cada tupla es un par de elementos que se pueden acceder mediante un índice. Las listas de tuplas son útiles para almacenar datos que se pueden agrupar en pares o en grupos de dos elementos. Por ejemplo, se pueden utilizar para almacenar coordenadas geográficas, fechas y horas, o cualquier otro tipo de datos que se puedan agrupar en pares.

# A diferencia de los mapas, las listas de tuplas no tienen claves asociadas a los valores. En su lugar, los valores se almacenan en pares ordenados, donde el primer elemento de la tupla es el índice del valor en la lista. Por ejemplo, si se tiene una lista de tuplas con las coordenadas geográficas de varias ciudades, se puede acceder a las coordenadas de una ciudad específica mediante su índice en la lista.

# Los mapas son más eficientes que las listas de tuplas para buscar valores, ya que los mapas utilizan una estructura de datos basada en tablas de hash que permite buscar valores en tiempo constante. En cambio, las listas de tuplas requieren recorrer la lista para buscar un valor, lo que puede ser menos eficiente en términos de tiempo de ejecución.

# Los mapas ocupan más memoria que las listas de tuplas, ya que los mapas almacenan las claves y los valores en la memoria, mientras que las listas de tuplas solo almacenan los valores. Por lo tanto, si se necesita almacenar grandes cantidades de datos en una estructura de datos, puede ser más eficiente utilizar listas de tuplas en lugar de mapas.

# Así mismo, agregar un elemento a una lista de tuplas es más eficiente que agregar un elemento a un mapa, ya que en una lista de tuplas solo se necesita agregar un nuevo par de elementos al inicio de la lista, mientras que en un mapa se necesita calcular el hash de la clave y buscar la posición en la tabla de hash para agregar el nuevo elemento.

# Los keywords list son una forma de representar una lista de tuplas en Elixir. Una keyword list es una lista de tuplas donde el primer elemento de cada tupla es un átomo que actúa como clave y el segundo elemento es el valor asociado a esa clave.

# Por ejemplo, la siguiente lista de tuplas:
lista = [{:a, "uno"}, {:b, "dos"}, {:c, "tres"}]

# Impresión de la lista
IO.inspect(lista)

# Se puede representar como una keyword list de la siguiente manera:
lista = [a: "uno", b: "dos", c: "tres"]

# Impresión de la lista
IO.inspect(lista)

# Pueden haber elementos repetidos en una keyword list.
lista = [a: "uno", b: "dos", c: "tres", a: "cuatro"]

# Impresión de la lista
IO.inspect(lista)

# Todas las funciones de las listas de Elixir pueden ser utilizadas con las keyword list.

# Se pueden acceder a los elementos de una keyword list utilizando el operador de acceso [].
IO.puts(lista[:a]) # "uno", aunque hay dos elementos con la clave :a, se obtiene el primero porque es el primero que se encuentra en la lista.

# Se pueden agregar elementos a una keyword list, es muy eficiente agregar elementos al inicio de la lista.
lista = [{:d, "cinco"} | lista]

# Impresión de la lista
IO.inspect(lista)

# Buscar un elemento en una keyword list, puede ser ineficiente si la lista es muy grande.
valor = Enum.find(lista, fn {clave, _} -> clave == :b end)

# Impresión del valor
IO.inspect(valor)
