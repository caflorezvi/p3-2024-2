defmodule Apoyo do
  @moduledoc """
  Módulo que provee las funciones de apoyo necesarias para realzar aplicaciones sencillas.
  autor: Área de programación Uniquindio
  fecha: Marzo del 2024
  licencia: GNU GPL v3
  """

  @doc """
  Función para ingresar un dato desde el teclado 

  ## Parámetros

    - mensaje: String que contiene el texto que se le presenta al usuario
    - :texto, para indicar que se desea ingresar una cadena de texto 
              (importante para futuros tipos de datos) o
    - :entero si lo que se desea ingresar es un número entero

  ## Ejemplos

    iex> Apoyo.ingresar("Ingrese su edad: ", :entero)
    iex> Apoyo.ingresar("Ingrese su nombre: ", :texto)

  o puede usar 

    "Ingrese su edad: "
    |> Apoyo.ingresar(:entero)

    ...
  """
  def ingresar(mensaje, :entero) do
    mensaje
    |> ingresar(:texto)
    |> String.to_integer()
  end

  def ingresar(mensaje, :texto) do
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

# EJEMPLO

nombre = 
  "Ingrese su nombre: "
  |> Apoyo.ingresar(:texto)

n1 =
  "Ingrese su valor n1: "
  |> Apoyo.ingresar(:entero)

n2 =
  "Ingrese su valor n2: "
  |> Apoyo.ingresar(:entero)

suma = n1 + n2

"Hola #{nombre}, la suma de #{n1} con #{n2}  es de #{suma}"
|> Apoyo.mostrar_mensaje()
