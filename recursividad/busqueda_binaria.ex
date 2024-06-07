defmodule BusquedaBinaria do

  @moduledoc """
    Módulo que implementa la búsqueda binaria. La búsqueda binaria es un algoritmo de búsqueda eficiente que permite encontrar un valor en una lista ordenada.
  """

  @doc """
    Ordena una lista de enteros.
  """
  def ordenar(lista) do
    lista
    |> Enum.sort()
  end

  @doc """
    Busca un valor en una lista ordenada.
  """
  def buscar(lista, valor) do
    lista_ordenada = lista |> ordenar()
    buscar(lista_ordenada, valor, 0, length(lista_ordenada) - 1)
  end

  defp buscar(_lista, _valor, inicio, fin) when inicio > fin, do: false

  defp buscar(lista, valor, inicio, fin) do
    medio = div(inicio + fin, 2)

    case Enum.at(lista, medio) do
      ^valor -> true
      x when x > valor -> buscar(lista, valor, inicio, medio - 1)
      _ -> buscar(lista, valor, medio + 1, fin)
    end

  end

end

defmodule Main do

  def run do
    respuesta = BusquedaBinaria.buscar( [2,3,7,9,1], 2 )
    IO.puts(respuesta)
  end

end

Main.run()
