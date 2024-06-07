defmodule ListaNumeros do
  @moduledoc """
    Módulo que contiene funciones para pedir números enteros al usuario y convertirlos a binario.
  """

  @doc """
    Función que pide números enteros al usuario y los almacena en una lista.
    Si el usuario ingresa la palabra 'fin', la función termina y devuelve la lista de números.
  """
  def pedir_numeros() do
    pedir_numeros([])
  end

  defp pedir_numeros(lista) do

    "Ingresa un número o escribe fin para terminar: " |> IO.puts()
    valor = IO.gets("> ") |> String.trim()

    case valor do

      "fin" ->
        lista

      _ ->
        case Integer.parse(valor) do
          :error ->
            "Debe ingresar un número entero" |> IO.puts()
            pedir_numeros(lista)

          {numero, _} ->
            pedir_numeros( [numero | lista] )

        end

    end

  end

  @doc """
    Función que convierte una lista de números enteros a binario, usando Enum.map que recorre la lista y aplica la función convertir_binario a cada elemento.
  """
  def convertir_numeros(lista) do
    lista
    |> Enum.map(&convertir_binario/1)
    |> Enum.reverse()
  end

  defp convertir_binario(0), do: 0
  defp convertir_binario(1), do: 1

  defp convertir_binario(numero) do
    convertir_binario( div(numero, 2) ) * 10 + rem(numero, 2)
  end

end

defmodule Main do

  def run do
    numeros = ListaNumeros.pedir_numeros()
    respuesta = ListaNumeros.convertir_numeros( numeros )
    IO.inspect(respuesta)
  end

end

Main.run()
