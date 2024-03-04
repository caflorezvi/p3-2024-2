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
  def ingresar(mensaje, :entero),
    do: ingresar(mensaje, &String.to_integer/1, "Error, se espera que ingrese un número entero\n")

  def ingresar(mensaje, :real),
    do: ingresar(mensaje, &String.to_float/1, "Error, se espera que ingrese un número real\n")

  def ingresar(mensaje, :texto), do: ingresar_texto(mensaje)

  @doc """
  Función privada que permite leer un dato del teclado de forma parametrizada

  ## Parámetros
    - parser: función que se aplica al texto ingresado por usuario para su conversión al dato de interés (o la función identidad)
    - mensaje: String que contiene el texto que se le presenta al usuario
  """
  defp ingresar(mensaje, parser, mensaje_error) do
    try do
      mensaje |> ingresar_texto() |> parser.()
    rescue
      ArgumentError ->
        IO.puts(:standard_error, mensaje_error)
        ingresar(mensaje, parser,  mensaje_error)
    end
  end

  @doc """
  Función privada para ingresar un texto desde el teclado

  ## Parámetros

    - mensaje: String que contiene el texto que se le presenta al usuario

  ## Ejemplos

    iex> Apoyo.ingresar_texto("Ingrese su nombre")

    o puede usar

    "Ingrese su nombre"
    |> Apoyo.ingresar_texto()
  """
  defp ingresar_texto(mensaje) do
    mensaje
    |> IO.gets()
    |> String.trim()
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

n1 =
  "Ingrese su valor n1: "
  |> Apoyo.ingresar(:entero)

n2 =
  "Ingrese su valor n2: "
  |> Apoyo.ingresar(:entero)

suma = n1 + n2

"La suma de #{n1} con #{n2}  es de #{suma}"
|> Apoyo.mostrar_mensaje()
