defmodule Apoyo do
  @moduledoc """
  Módulo que provee las funciones de apoyo necesarias para realzar aplicaciones sencillas.
  autor: Área de programación Uniquindio
  fecha: Marzo del 2024
  licencia: GNU GPL v3
  """

  @doc """
  Función para ingresar un dato desde el teclado (valido que se ingrese un dato válido)

  ## Parámetros

    - mensaje: String que contiene el texto que se le presenta al usuario

  ## Ejemplos

    iex> Apoyo.ingresar("Ingrese su edad: ", :entero)
    iex> Apoyo.ingresar("Ingrese su altura: ", :real)
    iex> Apoyo.ingresar("Ingrese su nombre: ", :texto)
    iex> Apoyo.ingresar("Ingrese su nombre: ")

  o puede usar 

    "Ingrese su edad: "
    |> Apoyo.ingresar(:entero)

    ...

  """
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def ingresar(mensaje, :entero),
    do: ingresar(mensaje, &String.to_integer/1, "Error, se espera que ingrese un número entero\n")

  def ingresar(mensaje, :real),
    do: ingresar(mensaje, &String.to_float/1, "Error, se espera que ingrese un número real\n")

  # Función privada de apoyo para crear la lectura con validación de enteros y reales.
  defp ingresar(mensaje, parser, mensaje_error) do
    try do
      mensaje
      |> ingresar(:texto)
      |> parser.()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número entero\n"
        |> mostrar_error()

        mensaje
        |> ingresar(parser, mensaje_error)
    end
  end

  @doc """
  Función para mostrar un mensaje en la pantalla

  ## Parámetros

    - mensaje: String que se desea mostrar

  ## Ejemplos

    iex> Apoyo.mostrar_mensaje("Bienvenido a Elixir")

    o puede usar

    "Bienvenido a Elixir"
    |> Apoyo.mostrar_mensaje()
  """
  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end

  @doc """
  Función para mostrar un mensaje de error en la pantalla

  ## Parámetros

    - mensaje: String que se desea mostrar

  ## Ejemplos

    iex> Apoyo.mostrar_error("Mensaje de error a mostrar")

    o puede usar

    "Mensaje de error a mostrar"
    |> Apoyo.mostrar_error()
  """
  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end

# EJEMPLO

nombre =
  "Ingrese su nombre: "
  |> Apoyo.ingresar(:texto)

altura =
  "Ingrese su altura en metros: "
  |> Apoyo.ingresar(:real)

n1 =
  "Ingrese su valor n1: "
  |> Apoyo.ingresar(:entero)

n2 =
  "Ingrese su valor n2: "
  |> Apoyo.ingresar(:entero)

suma = n1 + n2

"Hola #{nombre}, su altura es de #{altura} y la suma de #{n1} con #{n2}  es de #{suma}"
|> Apoyo.mostrar_mensaje()
