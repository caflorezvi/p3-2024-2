defmodule CrudInterface do
  @moduledoc """
    Interfaz para el módulo Crud que permite interactuar con el agente.
  """

  def iniciar do
    Crud.iniciar([])
  end

  def detener do
    Crud.detener()
  end

  def crear(id, nombre, edad) do
    case Crud.crear_persona(id, nombre, edad) do
      {:error, mensaje} -> mensaje
      :ok -> "Persona creada correctamente"
    end
  end

  def listar do
    Crud.leer_personas()
  end

  def obtener(id) do
    Crud.leer_persona(id)
  end

  def actualizar(id, nombre, edad) do
    case Crud.actualizar_persona(id, nombre, edad) do
      {:error, mensaje} -> mensaje
      :ok -> "Persona actualizada correctamente"
    end
  end

  def eliminar(id) do
    case Crud.eliminar_persona(id) do
      {:error, mensaje} -> mensaje
      :ok -> "Persona eliminada correctamente"
    end
  end


end
