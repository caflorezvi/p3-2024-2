defmodule Fibonacci do

  def calcular_fibonacci(n) when n < 0 do
    {:error, "El número debe ser no negativo"}
  end

  def calcular_fibonacci(0), do: 0
  def calcular_fibonacci(1), do: 1

  def calcular_fibonacci(n) when n > 1 do
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


defmodule Main do
  def run do

    IO.puts("Introduce un número entero:")
    user_input = IO.gets("> ")

    case Integer.parse(user_input) do
      :error -> IO.puts("Debes introducir un número entero")
      {n, _} ->
        case FibonacciMejorado.calcular_fibonacci(n) do
          {:error, message} -> IO.puts(message)
          result -> IO.puts("El resultado es: #{result}")
        end
    end

  end

end

Main.run()
