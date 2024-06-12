defmodule Benchmark do
  @moduledoc """
    Módulo que contiene funciones para comparar el rendimiento de listas y mapas en Elixir.
  """

  @doc """
    Crea una lista con elementos del 1 al número de elementos especificado.
    También se puede crear una lista con la función Enum.to_list(1..elementos)
  """
  def crear_lista(elementos) do
    1..elementos
    |> Enum.map( fn n -> n end )
  end

  @doc """
    Crea un mapa con elementos del 1 al número de elementos especificado.
    También se puede crear un mapa con la función Enum.into(%{}, 1..elementos)
  """
  def crear_mapa(elementos) do
    1..elementos
    |> Enum.reduce( %{}, fn n, mapa -> Map.put(mapa, n, n) end )
  end

  @doc """
    Busca un valor en una lista o en un mapa.
  """
  def buscar(lista, valor) when is_list(lista) do
    lista
    # Se filtran los elementos que sean iguales al valor especificado
    |> Enum.filter( fn n -> n == valor end )
  end

  def buscar(mapa, valor) when is_map(mapa) do
    mapa
    # Se obtiene el valor asociado a la clave especificada
    |> Map.get(valor)
  end

  @doc """
    Mide el tiempo que tarda en ejecutarse una función.
  """
  def medir(funcion) do
    funcion
    |> :timer.tc()
    |> elem(0)
  end

end

defmodule Main do

  def run do

    elementos = 10000000
    IO.puts("Creando una lista y un mapa con #{elementos} elementos")
    lista = Benchmark.crear_lista(elementos)
    mapa = Benchmark.crear_mapa(elementos)

    IO.puts("Buscando en la lista el número #{elementos}")
    tiempo_lista = Benchmark.medir( fn -> Benchmark.buscar(lista, elementos) end )
    IO.puts("El tiempo que tardó en encontrar el elemento #{elementos} en la lista fue de: #{tiempo_lista} microsegundos")

    IO.puts("Buscando en el mapa el número #{elementos}")
    tiempo_mapa = Benchmark.medir( fn -> Benchmark.buscar(mapa, elementos) end )
    IO.puts("El tiempo que tardó en encontrar el elemento #{elementos} en el mapa fue de: #{tiempo_mapa} microsegundos")

  end

end

Main.run()
