# En Elixir, la inmutabilidad es una característica fundamental. Esto significa que una vez que se asigna un valor a una variable, no se puede cambiar. En lugar de modificar el valor de una variable, se crea una nueva variable con el nuevo valor. Esto es útil para evitar errores y facilitar la depuración del código.
# En Elixir, las variables se asignan con el operador =. Las variables pueden contener cualquier tipo de dato, como enteros, flotantes, cadenas de texto, booleanos, listas, tuplas, mapas, etc.

# Tipos de datos básicos

# Números

# En Elixir, los números son enteros o flotantes. Los enteros son números sin decimales y los flotantes son números con decimales. Los números enteros pueden ser positivos o negativos. Los flotantes pueden ser positivos o negativos y pueden tener decimales. Los números enteros y flotantes son de precisión arbitraria, lo que significa que no hay un límite en el tamaño de los números enteros o flotantes. Los números enteros y flotantes se pueden representar en notación decimal, hexadecimal, octal y binaria.
a = 1 # Entero, se puede usar _ para separar los dígitos para mejorar la legibilidad (1_000_000)
b = 3.0 # Flotante

# Operaciones aritméticas
c = a + b # Suma
d = a - b # Resta
e = a * b # Multiplicación
f = a / b # División
g = rem(a, 2) # Resto
h = div(a, 2) # Cociente

# Cadena de texto

# En Elixir, las cadenas de texto son listas de caracteres. Los caracteres son enteros que representan un carácter Unicode. Las cadenas de texto se pueden definir con comillas dobles o comillas simples. Las cadenas de texto se pueden concatenar con el operador <>.

nombre = "Juan"
apellido = "Pérez"
nombre_completo = nombre <> " " <> apellido # "Juan Pérez" con concatenación de cadenas
nombre_completo = "#{nombre} #{apellido}" # "Juan Pérez" con interpolación de cadenas

# String es un módulo que contiene funciones para trabajar con cadenas de texto. Algunas funciones útiles del módulo String son upcase, downcase, capitalize, reverse, length, slice, split, etc.

nombre_mayusculas = String.upcase(nombre) # "JUAN"
nombre_minusculas = String.downcase(nombre) # "juan"
nombre_capitalizado = String.capitalize(nombre) # "Juan"
nombre_invertido = String.reverse(nombre) # "nauJ"
longitud_nombre = String.length(nombre) # 4
subcadena_nombre = String.slice(nombre, 0..2) # "Jua"
nombre_separado = String.split(nombre, "u") # ["J", "an"]

# Booleanos

# En Elixir, los booleanos son valores que representan verdadero o falso. Los booleanos son útiles para controlar el flujo de un programa. Los booleanos se pueden definir con las palabras clave true y false.

a = true
b = false

#Operadores lógicos

# En Elixir, los operadores lógicos son útiles para combinar o invertir valores booleanos. Los operadores lógicos son and, or y not. El operador and devuelve true si ambos operandos son true. El operador or devuelve true si al menos uno de los operandos es true. El operador not devuelve true si el operando es false.

c = a and b # false
d = a or b # true
e = not a # false

# Operadores de comparación

a = 1
b = 2

c = a == b # Igual a
d = a != b # Diferente de
e = a < b # Menor que
f = a <= b # Menor o igual que
g = a > b # Mayor que
h = a >= b # Mayor o igual que

# Operador pipe. El operador pipe |> se utiliza para encadenar funciones en Elixir. El operador pipe toma el resultado de la expresión a su izquierda y lo pasa como primer argumento a la función a su derecha. Esto permite escribir código de manera más legible y concisa.

# Ejemplo 1 de uso del operador pipe

a = 1
b = 2
c = 3

resultado = a + b |> div(c) # Equivalente a div(a + b, c)

# Ejemplo 2 de uso del operador pipe

nombre = "Juan Pérez"
nombre_mayusculas = nombre |> String.upcase() # Equivalente a String.upcase(nombre)

# Ejemplo 3 de uso del operador pipe

"Lenguaje de programación Elixir"  |> String.upcase() |> String.split() # ["LENGUAJE", "DE", "PROGRAMACIÓN", "ELIXIR"]

# Operador ^. El operador ^ se utiliza para acceder a variables en patrones de coincidencia. El operador ^ se utiliza para evitar la reasignación de variables en patrones de coincidencia.

# Asignamos un valor a la variable x
x = 10

# Usamos el operador ^ para hacer coincidir el valor de x en el patrón. Case es una estructura de control que permite hacer coincidencias de patrones.
case {10, 20} do
  {^x, y} ->
    IO.puts("Coincidió con el valor de x: #{x}, y el valor de y es: #{y}")
  _ ->
    IO.puts("No coincidió")
end
