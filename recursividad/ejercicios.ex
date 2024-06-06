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

end

defmodule Main do
  def run do

    numero = 3
    contador = Lista.contar_repeticiones( [1,2,2,3,5], numero )

    case contador do
      1 -> IO.puts "El número #{numero} se repite 1 vez"
      _ -> IO.puts "El número #{numero} se repite #{contador} veces"
    end

  end

end

Main.run()
