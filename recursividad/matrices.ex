defmodule Matrices do
  @moduledoc """
    Módulo que contiene funciones para trabajar con matrices. Para el recorrido de las matrices se utiliza for y se accede a los elementos de la matriz con Enum.at.
  """

  @doc """
    Función que crea una matriz de filas x columnas y la llena con ceros.
  """
  def crear_matriz(filas, columnas) do
    for _ <- 0 .. filas-1 do
      for _ <- 0 .. columnas-1 do
        0
      end
    end
  end

  @doc """
    Función que llena los bordes de una matriz con 1. Los bordes de una matriz son la primera fila, la última fila, la primera columna y la última columna.
  """
  def llenar_bordes(matriz) do
    filas = length(matriz)
    columnas = length( List.first(matriz) )

    for i <- 0 .. filas-1 do
      for j <- 0 .. columnas-1  do
        cond do
          i == 0 or i == filas - 1 or j == 0 or j == columnas - 1 ->
            1
          true ->
            Enum.at(Enum.at(matriz, i), j)
        end
      end
    end

  end

  @doc """
    Función que crea una matriz de tamaño size x size y llena la matriz con los valores de la función valor_celda.
    La función valor_celda recibe dos parámetros a y b y devuelve el valor que se debe colocar en la celda de la matriz.
  """
  def crear_matriz_patron(size) do
    for i <- 0..(size - 1) do
      for j <- 0..(size - 1) do
        valor_celda(size - i, size - j)
      end
    end
  end

  defp valor_celda(a, b) when a >= b, do: a
  defp valor_celda(_, b), do: b

  @doc """
    Función que imprime una matriz en la consola.
  """
  def imprimir_matriz(matriz) do

    for fila <- matriz do
      IO.puts( Enum.join( fila, "\t" ) )
    end

  end

end

defmodule MatricesRecursividad do
  @moduledoc """
    Módulo que contiene funciones recursivas para trabajar con matrices.
  """

  @doc """
    Función que suma los elementos de la diagonal principal de una matriz cuadrada. La diagonal principal es aquella que va desde la esquina superior izquierda a la esquina inferior derecha.
  """
  def sumar_diagonal(matriz) do
    sumar_diagonal(matriz,0,0)
  end

  defp sumar_diagonal([], _indice, suma), do: suma
  defp sumar_diagonal([cabeza | cola], indice, suma), do: sumar_diagonal(cola, indice+1, suma + Enum.at( cabeza, indice ) )

  @doc """
    Función que busca un elemento en una matriz. La función devuelve true si el elemento se encuentra en la matriz y false en caso contrario.
    Esta versión de la función utiliza un Enum.find para buscar el elemento en cada fila de la matriz.
  """
  def buscar_elemento_v1(matriz, elemento) do
    existe_v1?(matriz, elemento)
  end

  @doc """
    Función que busca un elemento en una matriz. La función devuelve true si el elemento se encuentra en la matriz y false en caso contrario.
    Esta versión de la función utiliza la función buscar_fila para buscar el elemento en cada fila de la matriz.
  """
  def buscar_elemento_v2(matriz, elemento) do
    existe_v2?(matriz, elemento)
  end

  @doc """
    Función que busca un elemento en una matriz. La función devuelve true si el elemento se encuentra en la matriz y false en caso contrario.
    Esta versión de la función utiliza List.flatten para convertir la matriz en una lista y luego utiliza Enum.find para buscar el elemento en la lista.
  """
  def buscar_elemento_v3(matriz, elemento) do
    respuesta = matriz |> List.flatten() |> Enum.find( &( &1 == elemento ) )

    case respuesta do
      nil -> false
      _ -> true
    end

  end

  defp existe_v1?([], _elemento), do: false

  defp existe_v1?([cabeza | cola], elemento) do
    case Enum.find(cabeza, &( &1 == elemento ) ) do
      nil -> existe_v1?(cola, elemento)
      _ -> true
    end
  end

  defp existe_v2?([], _elemento), do: false

  defp existe_v2?([cabeza | cola], elemento) do

    case buscar_fila(cabeza, elemento) do
      false -> existe_v2?(cola, elemento)
      true -> true
    end

  end

  defp buscar_fila([], _elemento ), do: false
  defp buscar_fila([cabeza | _cola], elemento ) when cabeza == elemento, do: true
  defp buscar_fila([_cabeza | cola], elemento ), do: buscar_fila(cola, elemento )

  def obtener_cadena_mas_larga(matriz) do
    obtener_cadena_mas_larga(matriz, "")
  end

  defp obtener_cadena_mas_larga( [], cadena ), do: cadena
  defp obtener_cadena_mas_larga( [cabeza | cola], cadena ) do

    mas_larga = Enum.max_by(cabeza, &String.length/1 )

    cond do
      String.length(mas_larga) > String.length(cadena) -> obtener_cadena_mas_larga( cola, mas_larga )
      true -> obtener_cadena_mas_larga( cola, cadena )
    end

  end

end

defmodule Main do

  def run do
    Matrices.crear_matriz_patron(6) |> Matrices.imprimir_matriz()
  end

end

defmodule MainRecursivo do

  def run do
    matriz = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    suma = MatricesRecursividad.sumar_diagonal( matriz )
    IO.puts("La suma de los elementos de la diagonal principal es: #{suma}")

    matriz2 = [["Carlos Andrés", "Juan", "Pedro"], ["Maria", "Luisa", "Carla"]]
    encontrado = MatricesRecursividad.obtener_cadena_mas_larga(matriz2)
    IO.puts(encontrado)

  end

end

Main.run()
