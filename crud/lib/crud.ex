defmodule Crud do
  @moduledoc """
    Módulo que implementa las operaciones CRUD sobre un agente. Un agente es un proceso que mantiene un estado y permite realizar operaciones sobre él de forma segura.
  """
  use Agent

  @doc """
    Inicia el agente con un mapa vacío.
  """
  def iniciar do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  @doc """
    Detiene el agente. Es importante detener el agente cuando ya no se necesite para liberar recursos.
  """
  def detener do
    Agent.stop(__MODULE__)
  end

  @doc """
    Crea una persona con un ID, nombre y edad. Si el ID ya existe, se retorna un error.
  """
  def crear_persona(id, nombre, edad) do
    case leer_persona(id) do
      nil ->
        Agent.get_and_update(__MODULE__, fn personas ->
          persona = %Persona{nombre: nombre, edad: edad}
          {:ok, Map.put(personas, id, persona)}
        end)
      _ ->
        {:error, "Ya existe una persona con el ID #{id}" }
    end
  end

  @doc """
    Lee una persona por ID. Si no existe, se retorna nil.
  """
  def leer_persona(id) do
    Agent.get( __MODULE__, fn personas -> Map.get(personas, id) end )
  end

  @doc """
    Lee todas las personas.
  """
  def leer_personas() do
    Agent.get( __MODULE__, fn personas -> personas end )
  end

  @doc """
    Elimina una persona por ID. Si no existe, se retorna un error.
  """
  def eliminar_persona(id) do
    case leer_persona(id) do
      nil ->
        {:error, "El ID #{id} no existe" }
      _ ->
        Agent.get_and_update( __MODULE__, fn personas ->
          {:ok, Map.delete(personas, id) }
        end)
    end
  end

  @doc """
    Actualiza una persona por ID. Si no existe, se retorna un error.
  """
  def actualizar_persona(id, nombre, edad) do
    case leer_persona(id) do
      nil ->
        {:error, "El ID #{id} no existe" }
      _ ->
        Agent.get_and_update( __MODULE__, fn personas ->
          {:ok, Map.update(personas, id, nil, fn persona -> %{persona | nombre: nombre, edad: edad} end ) }
        end)
    end
  end

end
