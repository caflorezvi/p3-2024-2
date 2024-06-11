defmodule ProcesamientoConcurrente do
  @moduledoc """
    Módulo que realiza procesamiento concurrente en una lista de elementos.
  """

  @doc """
    Incrementa un item en un valor dado.
  """
  def incrementar_item(item, incremento) do
    # Simulamos un proceso que toma tiempo
    Process.sleep(2000)
    item + incremento
  end

  @doc """
    Incrementa todos los elementos de una lista en un valor dado.
  """
  def incrementar_lista(lista, incremento) do
    lista
    # Por cada elemento de la lista
    |> Enum.map( fn e ->
      # Lanzamos un proceso por cada elemento de la lista
      Task.async( fn -> incrementar_item(e, incremento) end )
    end )
    # Esperamos a que todos los procesos terminen
    |> Enum.map(&Task.await/1)
  end

end

defmodule Main do

  def run do
    lista = [1,2,3,4,5]
    lista_nueva = ProcesamientoConcurrente.incrementar_lista(lista, 5)
    IO.puts("Lista nueva: #{inspect(lista_nueva)}")
  end

end

Main.run()
