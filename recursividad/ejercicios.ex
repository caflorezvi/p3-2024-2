defmodule Fibonacci do

  def calcular_fibonacci(0), do: 0

  def calcular_fibonacci(1), do: 1

  def calcular_fibonacci(n) when n < 0 do
    {:error, "El número debe ser no negativo"}
  end

  def calcular_fibonacci(n) when n > 1 do
    calcular_fibonacci(n - 1) + calcular_fibonacci(n - 2)
  end

end

IO.puts Fibonacci.calcular_fibonacci(10) # 55
