defmodule Archivos do
  @moduledoc """
    Módulo que contiene funciones para trabajar con archivos.
  """

  @doc """
    Función que lee el contenido de un archivo llamado nombres.txt y lo imprime en pantalla.
  """
  def leer_archivo_v1 do
    case File.read("nombres.txt") do
      {:ok, contenido} -> contenido |> IO.puts
      {:error, razon} -> IO.puts("Error al leer el archivo: #{razon}")
    end
  end

  @doc """
    Función que lee el contenido de un archivo llamado nombres.txt, separa cada línea, las une con una coma y lo imprime en pantalla.
  """
  def leer_archivo_v2 do
    case File.read("nombres.txt") do
      {:ok, contenido} -> String.split(contenido, "\n") |> Enum.join(", ") |> IO.puts
      {:error, razon} -> IO.puts("Error al leer el archivo: #{razon}")
    end
  end

  @doc """
    Función que lee el contenido de un archivo llamado nombres.txt línea por línea y une todas las líneas en una sola cadena separadas por una coma y lo imprime en pantalla.
  """
  def leer_archivo_linea_por_linea_v1 do
    File.stream!("nombres.txt")
    |> Enum.map(&String.trim/1)
    |> Enum.join(", ")
    |> IO.puts
  end

  @doc """
    Función que lee el contenido de un archivo llamado nombres.txt línea por línea.
  """
  def leer_archivo_linea_por_linea_v2 do
    # Se utiliza un bloque try para manejar la excepción File.Error que se lanza al intentar leer un archivo que no existe.
    try do
      "nombres.txt"
      |> File.stream!()
      |> Enum.each( &IO.puts/1 )
    rescue
      e in File.Error -> IO.puts("Error al leer el archivo: #{e.reason}")
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
    Archivos.leer_archivo_v2()
    IO.puts("--------------------")
    Archivos.leer_archivo_linea_por_linea_v1()
    IO.puts("--------------------")
    Archivos.leer_archivo_linea_por_linea_v2()
  end

end

Main.run()
