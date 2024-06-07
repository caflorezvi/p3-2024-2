defmodule TrianguloPascal do
  @moduledoc """
    Módulo que contiene funciones para generar y mostrar el triángulo de Pascal.
  """

  @doc """
    Función que genera el valor de un elemento del triángulo de Pascal.
  """
  def generar_valor(0, _), do: 1
  def generar_valor(_, 0), do: 1
  def generar_valor(n, k) when n == k , do: 1
  def generar_valor(n, k), do: generar_valor(n-1, k-1) + generar_valor(n-1, k)

  @doc """
    Función que llena una fila del triángulo de Pascal.
  """
  def llenar_fila(n) do
    for k <- 0 .. n do
      generar_valor(n, k)
    end
  end

  @doc """
    Función que imprime el triángulo de Pascal con un número de filas dado.
  """
  def imprimir_triangulo(filas) do
    for n <- 0 .. filas - 1 do
      IO.puts( Enum.join( llenar_fila(n), "\t" ) )
    end
  end

end

defmodule Main do

  def run do
    TrianguloPascal.imprimir_triangulo(6)
  end

end

Main.run()
