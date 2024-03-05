defmodule Persona do
  @moduledoc """
  Módulo para crear una persona con los datos: nombre, edad y altura
  autor: Área de programación Uniquindio
  fecha: Marzo del 2024
  licencia: GNU GPL v3
  """
  defstruct nombre: "", edad: 0, altura: 0.0

  @doc """
  Función para crear una persona dados sus datos básicos.

  ## Parámetros

    - nombre: Texto con nombre de la persona que desea crear
    - edad: Entero con la edad de la persona a crear
    - altura: Real con la altura de la persona a crear

  ## Ejemplos

    iex> Persona.crear("Diana", 40, 1.1)

  """
  def crear(nombre, edad, altura) do
    %Persona{nombre: nombre, edad: edad, altura: altura}
  end

  @doc """
  Función para convertir una persona una cadena de texto en un formato definido.

  ## Parámetros

    - persona: Datos básicos de una persona

  ## Ejemplo

    iex> Persona.crear("Diana", 40, 1.1)
         |> Apoyo.mostrar_mensaje()
  """
  def convertir_texto(persona) do
    "Hola #{persona.nombre}, tu edad es de #{persona.edad} y tienes una altura de #{Float.round(persona.altura, 2)}\n"
  end
end

# EJEMPLO 

Persona.crear("Diana", 40, 1.1)
|> Persona.convertir_texto()
|> Apoyo.mostrar_mensaje()
