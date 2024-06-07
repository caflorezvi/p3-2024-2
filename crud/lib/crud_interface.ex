defmodule CrudInterface do

  def iniciar do
    Crud.start_link([])
  end

  def crear(id, nombre, edad) do
    case Crud.crear_persona(id, nombre, edad) do
      :error -> "Ya existe una persona con el mismo ID"
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
      :error -> "El ID no existe"
      :ok -> "Persona actualizada correctamente"
    end
  end

  def eliminar(id) do
    case Crud.eliminar_persona(id) do
      :error -> "El ID no existe"
      :ok -> "Persona eliminada correctamente"
    end
  end


end
