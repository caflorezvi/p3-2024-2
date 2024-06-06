defmodule Fibonacci do

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

  def calcular_factorial(0), do: 1
  def calcular_factorial(1), do: 1

  def calcular_factorial(n) do
    n * calcular_factorial(n-1)
  end

end

defmodule MenorArreglo do

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

  def obtener_menor_bib(lista) do
    Enum.min(lista)
  end

end

defmodule Multiplicacion do

  def multiplicar(0, _b), do: 0
  def multiplicar(_a, 0), do: 0

  def multiplicar(a, b) do
    a + multiplicar(a, b-1)
  end

end

defmodule Division do

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

  def contar_repeticiones([cabeza | cola], numero) do
    if cabeza == numero do
      1 + contar_repeticiones(cola, numero)
    else
      contar_repeticiones(cola, numero)
    end
  end

  def contar_repeticiones([], _numero), do: 0

  def contar_repeticiones_bib(lista, numero) do
    Enum.count(lista, fn x -> x == numero end)
  end

end

defmodule Palindroma do

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

defmodule Main do
  def run do

    IO.puts("Ingrese una frase: ")
    frase = IO.gets("> ") |> String.trim()

    IO.puts Palindroma.validar_cadena(frase)

  end

end

Main.run()
