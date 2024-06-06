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

  def dividir(a, b) when a < b do
    0
  end

  def dividir(a, b) do
    1 + dividir(a-b, b)
  end

end

defmodule Main do
  def run do

    case Division.dividir( 80, 2 ) do

      {:error, mensaje} -> IO.puts mensaje
      menor -> IO.puts "El resultado es: #{menor}"

    end

  end

end

Main.run()
