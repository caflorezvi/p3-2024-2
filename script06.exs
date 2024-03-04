defmodule Apoyo do
  @moduledoc """
  Módulo que provee las funciones de apoyo necesarias para realzar aplicaciones sencillas.
  autor: Área de programación Uniquindio
  fecha: Marzo del 2024
  licencia: GNU GPL v3
  """

  @doc """
  Función para ingresar un número entero desde el teclado (valido que se ingrese un entero)

  ## Parámetros

    - mensaje: String que contiene el texto que se le presenta al usuario

  ## Ejemplos

    iex> Apoyo.ingresar_texto("Ingrese su edad")

    o puede usar

    edad =
      "Ingrese su edad"
      |> Apoyo.ingresar_entero()
  """
  def ingresar_entero(mensaje) do
    try do
      mensaje
      |> ingresar_texto()
      |> String.to_integer()
    rescue
      IO.puts(stderr, "Error, se espera que ingrese un número entero")

      mensaje
      |> ingresar_entero()
    end
  end

  @doc """
  Función para ingresar un texto desde el teclado

  ## Parámetros

    - mensaje: String que contiene el texto que se le presenta al usuario

  ## Ejemplos

    iex> Apoyo.ingresar_texto("Ingrese su nombre")

    o puede usar

    "Ingrese su nombre"
    |> Apoyo.ingresar_texto()
  """
  def ingresar_texto(mensaje) do
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
end

n1 = Apoyo.ingresar_entero("Ingrese su valor n1: ")
n2 = Apoyo.ingresar_entero("Ingrese su valor n2: ")

suma = n1 + n2

Apoyo.mostrar_mensaje("La suma de #{n1} con #{n2}  es de #{suma}")
