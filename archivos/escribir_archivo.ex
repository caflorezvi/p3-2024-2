defmodule Archivos do

  @doc """
    Función que escribe un contenido en un archivo llamado salida.txt.
  """
  def escribir_archivo_v1(contenido) do
    # Se utiliza un bloque try para manejar la excepción File.Error que se lanza al intentar escribir un archivo.
    case  File.write("salida.txt", contenido) do
      :ok ->
        IO.puts "Archivo escrito con éxito"
      {:error, reason} ->
        IO.puts "Error al escribir el archivo: #{reason}"
    end
  end

  @doc """
    Función que escribe un contenido en un archivo llamado salida.txt.
    Se utiliza el modo :append para agregar el contenido al final del archivo.
  """
  def escribir_archivo_v2(contenido) do
    # Se utiliza un bloque try para manejar la excepción File.Error que se lanza al intentar escribir un archivo.
    try do
      File.write("salida.txt", contenido, [:append])
    rescue
      e in File.Error -> IO.puts("Error al escribir el archivo: #{e.reason}")
    end
  end

  @doc """
    Función que escribe un contenido en un archivo llamado salida.txt.
    Se utiliza open para abrir el archivo y escribir en él en modo :append.
  """
  def escribir_archivo_v3(contenido) do

    case File.open("salida.txt", [:append, :utf8]) do
      {:ok, file} ->
        IO.write(file, contenido)
        File.close(file)
      {:error, reason} ->
        IO.puts "Error al escribir el archivo: #{reason}"
    end

  end

end

defmodule Main do
  @moduledoc """
    Módulo principal que ejecuta las funciones de Archivos.
  """

  @doc """
    Función que ejecuta las funciones de Archivos.
  """
  def run do
    Archivos.escribir_archivo_v1("¡Hola, Mundo 1!\n")
    Archivos.escribir_archivo_v2("¡Hola, Mundo 2!\n")
    Archivos.escribir_archivo_v3("¡Hola, Mundo 3!\n")
  end

end

Main.run()
