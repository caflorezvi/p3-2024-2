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
    [parte1, parte2, parte3, parte4] = dividir_lista(lista)

    # Se crean cuatro tareas que buscarán el número en cada parte de la lista
    tareas = [
      Task.async( fn -> buscar_parte(parte1, numero) end ),
      Task.async( fn -> buscar_parte(parte2, numero) end ),
      Task.async( fn -> buscar_parte(parte3, numero) end ),
      Task.async( fn -> buscar_parte(parte4, numero) end ),
    ]

    # Se espera a que todas las tareas finalicen y se obtiene el resultado de cada una
    resultado = tareas |> Enum.map( &Task.await/1 )

    # Se devuelve true si el número se encuentra en alguna parte de la lista.
    Enum.any?(resultado)

  end

  @doc """
    Divide una lista en cuatro partes. La última parte puede tener más elementos si la división no es exacta.
  """
  def dividir_lista(lista) do

    # Se obtiene el tamaño de la lista y se calcula el tamaño de cada parte
    tamano = length(lista)
    parte = div(tamano, 4)

    # Se obtiene cada parte de la lista
    parte1 = Enum.slice(lista, 0, parte)
    parte2 = Enum.slice(lista, parte, parte)
    parte3 = Enum.slice(lista, 2*parte, parte)
    parte4 = Enum.slice(lista, 3*parte, parte + rem(tamano, 4))

    # Se devuelven las partes de la lista en una lista
    [parte1, parte2, parte3, parte4]
  end

  @doc """
    Busca un número en una parte de una lista. Devuelve true si el número se encuentra en la parte.
  """
  def buscar_parte(parte, numero) do
    Enum.member?(parte, numero)
  end

end

defmodule Main do

  def run do
    numero = 10000001
    respuesta = BusquedaConcurrente.crear_lista(10000001)
    |> BusquedaConcurrente.buscar_numero(numero)

    IO.puts("¿Se ha encontrado el número #{numero}? #{respuesta}")

  end

end

Main.run()
