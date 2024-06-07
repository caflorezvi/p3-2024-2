defmodule Crud do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def crear_persona(id, nombre, edad) do
    Agent.update( __MODULE__, fn personas ->
      persona = %Persona{ nombre: nombre, edad: edad}
      Map.put( personas, id, persona )
    end )
  end

  def leer_persona(id) do
    Agent.get( __MODULE__, &( Map.get(&1, id) ) )
  end

  def leer_personas() do
    Agent.get( __MODULE__, fn personas -> personas end )
  end

  def eliminar_persona(id) do
    Agent.update( __MODULE__, &( Map.delete(&1, id)) )
  end

  def actualizar_persona(id, nombre, edad) do
    Agent.update( __MODULE__, &( Map.update(&1, id, nil, fn persona -> %{persona | nombre: nombre, edad: edad} end ) ) )
  end

end
