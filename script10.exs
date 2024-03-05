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

  ## Ejemplo

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

defmodule Amigos do
  @moduledoc """
  Módulo para crear una colección de personas (amigos)
  autor: Área de programación Uniquindio
  fecha: Marzo del 2024
  licencia: GNU GPL v3
  """
  defstruct personas: []

  @doc """
  Función para crear una lista de amigos vacía

  ## Ejemplo

    iex> Amigos.crear()
  """
  def crear() do
    %Amigos{personas: []}
  end

  @doc """
  Función para adicionar un amigo a una lista de amigos indicada

  ## Parámetros

    - lista, lista que contiene la lista de amigos actual
    - amigo, amigo que se desea adicionar a la lista indicada

    Observe que hay condiciones sobre dos dos parámetros (deben ser maps)

  ## Ejemplo

    iex> diana = Persona.crear("Diana", 40, 1.1)
    iex> Amigos.crear()
         |> Amigos.adicionar(diana)
  """
  def adicionar(lista, amigo) when is_map(lista) and is_map(amigo) do
    %{lista | personas: lista.personas ++ [amigo]}
  end

  @doc """
  Función para obtener la lista de amigos

  ## Parámetros

    - lista, lista que contiene la lista de amigos actual

  ## Ejemplo

    iex> diana = Persona.crear("Diana", 40, 1.1)
    iex> lista_amigos= 
          Amigos.crear()
         |> Amigos.adicionar(diana)
    iex> Amigos.obtener_amigos(lista_amigos)
  """
  def obtener_amigos(lista) do
    lista.personas
  end

  @doc """
  Función para convertir la lista de amigos en texto para facilitar su impresión

  ## Parámetros

    - lista, lista que contiene la lista de amigos actual

  ## Ejemplo

    iex> Amigos.obtener_amigos(lista_amigos)
         |> Apoyo.mostrar_mensaje()
  """
  def convertir_texto(lista) do
    lista
    |> Enum.map(&Persona.convertir_texto/1)
  end

  @doc """
  Función para obtener la lista de los amigos ordenados por nombre

  ## Parámetros

    - lista, lista que contiene la lista de amigos actual

  ## Ejemplo

    iex> Amigos.obtener_amigos_ordenados_por_nombre(lista_amigos)
         |> Apoyo.mostrar_mensaje()
  """
  def obtener_amigos_ordenados_por_nombre(lista) do
    lista
    |> Enum.sort_by(& &1.nombre)
  end

  @doc """
  Función para obtener la lista de los amigos mayores de edad

  ## Parámetros

    - lista, lista que contiene la lista de amigos actual

  ## Ejemplo

    iex> Amigos.obtener_amigos_mayores_de_edad(lista_amigos)
         |> Apoyo.mostrar_mensaje()
  """
  def obtener_amigos_mayores_de_edad(lista) do
    lista
    |> Enum.filter(fn amigo -> amigo.edad > 18 end)
  end
end

# EJEMPLO

diana = Persona.crear("Diana", 40, 1.1)
ana = Persona.crear("Ana", 16, 1.6)
juan = Persona.crear("Juan", 19, 1.8)

lista_amigos =
  Amigos.crear()
  |> Amigos.adicionar(diana)
  |> Amigos.adicionar(ana)
  |> Amigos.adicionar(juan)

Amigos.obtener_amigos(lista_amigos)
|> Amigos.convertir_texto()
|> Apoyo.mostrar_mensaje()

Amigos.obtener_amigos(lista_amigos)
|> Amigos.obtener_amigos_ordenados_por_nombre()
|> Amigos.convertir_texto()
|> Apoyo.mostrar_mensaje()

Amigos.obtener_amigos(lista_amigos)
|> Amigos.obtener_amigos_mayores_de_edad()
|> Amigos.convertir_texto()
|> Apoyo.mostrar_mensaje()
