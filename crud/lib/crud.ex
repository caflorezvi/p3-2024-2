defmodule Crud do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def crear_persona(id, nombre, edad) do
    Agent.get_and_update( __MODULE__, fn personas ->
      if !Map.has_key?(personas, id) do
        persona = %Persona{ nombre: nombre, edad: edad}
        {:ok, Map.put( personas, id, persona ) }
      else
        {:error, personas}
      end
    end)
  end

  def leer_persona(id) do
    Agent.get( __MODULE__, &( Map.get(&1, id) ) )
  end

  def leer_personas() do
    Agent.get( __MODULE__, fn personas -> personas end )
  end

  def eliminar_persona(id) do
    Agent.get_and_update( __MODULE__, fn personas ->
      if Map.has_key?(personas, id) do
        {:ok, Map.delete(personas, id) }
      else
        {:error, personas}
      end
    end)
  end

  def actualizar_persona(id, nombre, edad) do
    Agent.get_and_update( __MODULE__, fn personas ->
      if Map.has_key?(personas, id) do
        {:ok, Map.update(personas, id, nil, fn persona -> %{persona | nombre: nombre, edad: edad} end ) }
      else
        {:error, personas}
      end
    end)
  end

end
