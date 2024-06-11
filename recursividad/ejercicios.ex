defmodule Fibonacci do
  @moduledoc """
    Módulo que contiene funciones para calcular la serie de Fibonacci. La serie de Fibonacci es una sucesión de números en la que cada número es la suma de los dos anteriores.
  """

  @doc """
    Función que calcula el n-ésimo número de la serie de Fibonacci.
  """
  def calcular_fibonacci(n) when n < 0 do
    {:error, "El número debe ser no negativo"}
  end

  def calcular_fibonacci(0), do: 0
  def calcular_fibonacci(1), do: 1

  def calcular_fibonacci(n) do
    calcular_fibonacci(n - 1) + calcular_fibonacci(n - 2)
  end

end

defmodule FibonacciMejorado do
  @moduledoc """
    Módulo que contiene funciones para calcular la serie de Fibonacci de manera más eficiente.
  """

  @doc """
    Función que calcula el n-ésimo número de la serie de Fibonacci.
  """
  def calcular_fibonacci(n) when n < 0 do
    {:error, "El número debe ser no negativo"}
  end

  def calcular_fibonacci(0), do: 0
  def calcular_fibonacci(1), do: 1

  def calcular_fibonacci(n) do
    calcular_fibonacci(n, 0, 1)
  end

  defp calcular_fibonacci(0, a, _), do: a

  defp calcular_fibonacci(n, a, b) do
    calcular_fibonacci(n - 1, b, a + b)
  end

end

defmodule Factorial do
  @moduledoc """
    Módulo que contiene funciones para calcular el factorial de un número. El factorial de un número es el producto de todos los números enteros positivos desde 1 hasta el número.
  """

  @doc """
    Función que calcula el factorial de un número.
  """
  def calcular_factorial(0), do: 1
  def calcular_factorial(1), do: 1

  def calcular_factorial(n) do
    n * calcular_factorial(n-1)
  end

end

defmodule MenorArreglo do
  @moduledoc """
    Módulo que contiene funciones para obtener el menor número de una lista.
  """

  @doc """
    Función que obtiene el menor número de una lista.
  """
  def obtener_menor([]), do: {:error, "La lista está vacía"}

  def obtener_menor( [cabeza | cola] ) do
    obtener_menor(cola, cabeza)
  end

  defp obtener_menor([cabeza | cola], menor) when cabeza < menor do
    obtener_menor(cola, cabeza)
  end

  defp obtener_menor([_cabeza | cola], menor) do
    obtener_menor(cola, menor)
  end

  defp obtener_menor([], menor), do: menor

  @doc """
    Función que obtiene el menor número de una lista utilizando la función Enum.min/1.
  """
  def obtener_menor_bib(lista) do
    Enum.min(lista)
  end

end

defmodule Multiplicacion do
  @moduledoc """
    Módulo que contiene funciones para multiplicar dos números enteros.
  """

  @doc """
    Función que multiplica dos números enteros.
  """
  def multiplicar(0, _b), do: 0
  def multiplicar(_a, 0), do: 0

  def multiplicar(a, b) do
    a + multiplicar(a, b-1)
  end

end

defmodule Division do
  @moduledoc """
    Módulo que contiene funciones para dividir dos números enteros.
  """

  @doc """
    Función que divide dos números enteros.
  """
  def dividir(_a, 0), do: {:error, "La división es indeterminada"}

  def dividir(a, b) do
    {respuesta, residuo} = dividir(a, b, 0)
    {respuesta, residuo}
  end

  defp dividir(a, b, suma) when a < b do
    {suma, a}
  end

  defp dividir(a, b, suma) do
    dividir(a-b, b, suma+1)
  end

end

defmodule Lista do
  @moduledoc """
    Módulo que contiene funciones para trabajar con listas.
  """

  @doc """
    Función que cuenta las repeticiones de un número en una lista.
  """
  def contar_repeticiones([cabeza | cola], numero) do
    if cabeza == numero do
      1 + contar_repeticiones(cola, numero)
    else
      contar_repeticiones(cola, numero)
    end
  end

  def contar_repeticiones([], _numero), do: 0

  @doc """
    Función que cuenta las repeticiones de un número en una lista utilizando la función Enum.count/2.
  """
  def contar_repeticiones_bib(lista, numero) do
    Enum.count(lista, fn x -> x == numero end)
  end

end

defmodule Palindroma do
  @moduledoc """
    Módulo que contiene funciones para determinar si una cadena es palíndroma. Un palíndromo es una palabra o frase que se lee igual de izquierda a derecha que de derecha a izquierda.
  """

  @doc """
    Función que determina si una cadena es palíndroma.
  """
  def validar_cadena(cadena) do
    normalizada = cadena
                  |> String.downcase()
                  |> String.replace(" ", "")

    es_palindroma?(normalizada, 0, String.length(normalizada) - 1)
  end

  defp es_palindroma?(cadena, i, j) do
    if i >= j do
      true
    else
      if String.at(cadena, i) == String.at(cadena, j) do
        es_palindroma?(cadena, i+1, j-1)
      else
        false
      end
    end
  end

end

defmodule PalindromaLista do
  @moduledoc """
    Módulo que contiene funciones para determinar si una cadena es palíndroma utilizando listas. Un palíndromo es una palabra o frase que se lee igual de izquierda a derecha que de derecha a izquierda.
  """

  @doc """
    Función que determina si una cadena es palíndroma.
  """
  def validar_cadena(cadena) do

    normalizada = cadena
                  |> String.downcase()
                  |> String.replace(" ", "")
                  |> String.to_charlist()

    es_palindroma?(normalizada)
  end

  defp es_palindroma?([]), do: true
  defp es_palindroma?([_]), do: true

  defp es_palindroma?( [cabeza | cola] ) do

    if cabeza == List.last(cola) do
      es_palindroma?( List.delete_at( cola, length(cola)-1 ) )
    else
      false
    end

  end

end

defmodule NumeroPerfecto do
  @moduledoc """
    Módulo que contiene funciones para determinar si un número es perfecto. Un número es perfecto si la suma de sus divisores es igual al número.
  """

  @doc """
    Función que determina si un número es perfecto.
  """
  def es_perfecto?(numero) when numero <= 0, do: false

  def es_perfecto?(numero) do
    sumar_divisores(numero, div(numero, 2)) == numero
  end

  defp sumar_divisores(_numero, 0), do: 0

  defp sumar_divisores(numero, divisor) do
    if rem(numero, divisor) == 0 do
      divisor + sumar_divisores(numero, divisor-1)
    else
      sumar_divisores(numero, divisor-1)
    end
  end

end

defmodule Potencia do
  @moduledoc """
    Módulo que contiene funciones para determinar si un número es potencia de otro.
  """

  @doc """
    Función que determina si un número es potencia de otro. Un número n es potencia de b si n = b^k para algún k entero positivo.
  """
  def es_potencia?(n, _b) when n == 1, do: true
  def es_potencia?(n, b) do
    if rem(n, b) == 0 do
      es_potencia?(div(n, b), b)
    else
      false
    end
  end

end

defmodule Utils do
  @moduledoc """
    Módulo que contiene funciones para imprimir y leer datos del usuario.
  """

  @doc """
    Función que imprime un mensaje en la consola.
  """
  def imprimir(mensaje) do
    mensaje
    |> IO.puts()
  end

  @doc """
    Función que lee un mensaje del usuario.
  """
  def leer(mensaje) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  @doc """
    Función que lee un número entero del usuario.
  """
  def leer_numero(mensaje) do
    mensaje
    |> leer()
    |> Integer.parse()
    |> case do
      :error -> {:error, "Debe ingresar un número entero"}
      {numero, _} -> {:ok, numero}
    end

  end

end

defmodule Repeticiones do
  @moduledoc """
    Módulo que contiene funciones para contar las repeticiones de letras en una lista de palabras.
  """

  @doc """
    Función que cuenta las repeticiones de letras en una lista de palabras. Y devuelve la letra que más se repite.
  """
  def obtener_letra_mayor_frecuencia_v1(lista) do
    recorrer_lista(lista, %{})
    |> letra_mas_repetida()
  end

  def obtener_letra_mayor_frecuencia_v2(lista) do
    lista
    |> Enum.flat_map( &String.graphemes/1 )
    |> Enum.frequencies()
    |> Enum.max_by( &elem(&1, 1) )
  end

  defp recorrer_lista([], memo), do: memo

  defp recorrer_lista([cabeza | cola], memo) do
    # Convertir la palabra a minúsculas
    palabra = String.downcase(cabeza)
    nuevo_memo = contar_letra(palabra, memo)
    recorrer_lista(cola, nuevo_memo)
  end

  defp contar_letra(palabra, memo) when palabra == "", do: memo

  defp contar_letra(palabra, memo) do
    letra = String.first(palabra)
    # Si la letra no está en el mapa, se agrega con valor 1, si ya está se incrementa en 1
    nuevo_memo = Map.update(memo, letra, 1, &(&1 + 1))
    contar_letra( String.slice(palabra, 1..-1//1), nuevo_memo)
  end

  defp letra_mas_repetida(memo) do
    memo
    |> Enum.max_by( fn {_letra, total} -> total end )
  end

end

defmodule Main do
  def run do

    Utils.imprimir("Ingrese un número positivo: ")

    case Utils.leer_numero("> ") do
      {:error, mensaje} -> Utils.imprimir( mensaje )
      {:ok, numero} -> Utils.imprimir( "El número #{numero} es perfecto? #{NumeroPerfecto.es_perfecto?(numero)}" )
    end

  end

end

Main.run()
