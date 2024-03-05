defmodule Apoyo do
  @moduledoc """
  Módulo que provee las funciones de apoyo necesarias para realzar aplicaciones sencillas.
  autor: Área de programación Uniquindio
  fecha: Marzo del 2024
  licencia: GNU GPL v3
  """

  @doc """
  Función para ingresar un texto desde el teclado

  ## Parámetros

    - mensaje, String que contiene el texto que se le presenta al usuario
    - :texto, para indicar que se desea ingresar una cadena de texto 
              (importante para futuros tipos de datos) 

  ## Ejemplos

    iex> Apoyo.ingresar("Ingrese su nombre", :texto)

    o puede usar

    "Ingrese su nombre"
    |> Apoyo.ingresar(:texto)
  """
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

"Hola #{nombre}"
|> Apoyo.mostrar_mensaje()
