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

  @doc """
    Función que suma los números de una lista. La función utiliza Enum.reduce para sumar los elementos de la lista.
  """
  def sumar_numeros_v1(lista) do
    Enum.reduce(lista, 0, fn x, y -> x + y end)
  end

  @doc """
    Función que suma los números de una lista. La función utiliza Enum.reduce y una función anónima para sumar los elementos de la lista.
  """
  def sumar_numeros_v2(lista) do
    Enum.reduce(lista, 0, &( &1 + &2 ))
  end

  @doc """
    Función que suma los números de una lista. La función utiliza recursividad para sumar los elementos de la lista.
  """
  def sumar_numeros_v3([]), do: 0
  def sumar_numeros_v3([cabeza | cola]), do: cabeza + sumar_numeros_v3(cola)

  @doc """
    Función que invierte una lista. La función utiliza recursividad para invertir la lista.
  """
  def invertir_lista(lista) do
    invertir_lista(lista, [])
  end

  defp invertir_lista([], lista_invertida), do: lista_invertida
  defp invertir_lista([cabeza | cola], lista_invertida), do: invertir_lista(cola, [cabeza | lista_invertida])

end

defmodule Main do

  def run do
    respuesta = ListaNumeros.pedir_numeros() |> ListaNumeros.invertir_lista()
    IO.inspect(respuesta)
  end

end

Main.run()
