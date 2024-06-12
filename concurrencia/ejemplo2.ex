defmodule BusquedaConcurrente do
  @moduledoc """
    Módulo que contiene funciones para buscar un número en una lista de forma concurrente.
  """

  @doc """
    Crea una lista con elementos del 1 al número de elementos especificado.
  """
  def crear_lista(numeros), do: Enum.to_list(1..numeros)

  @doc """
    Busca un número en una lista de forma concurrente.
  """
  def buscar_numero(lista, numero) do

    # Se divide la lista en cuatro partes
    partes = Enum.chunk_every(lista, div(length(lista), 4))

    # Por cada parte se crea una tarea que buscará el número
    tareas = partes
    |> Enum.map( fn parte -> Task.async( fn -> buscar_parte(parte, numero) end ) end )

    # Se espera a que todas las tareas finalicen y se obtiene el resultado de cada una
    resultado = tareas |> Enum.map( &Task.await/1 )

    # Se devuelve true si el número se encuentra en alguna parte de la lista.
    Enum.any?(resultado)

  end

  @doc """
    Busca un número en una parte de una lista. Devuelve true si el número se encuentra en la parte.
  """
  def buscar_parte(parte, numero), do: Enum.member?(parte, numero)

end

defmodule Main do

  def run do
    numero = 2
    respuesta = BusquedaConcurrente.crear_lista(10000000)
    |> BusquedaConcurrente.buscar_numero(numero)

    IO.puts("¿Se ha encontrado el número #{numero}? #{respuesta}")

  end

end

Main.run()
