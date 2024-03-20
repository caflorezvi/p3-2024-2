defmodule Saludo do
  def hola() do
    IO.puts "Hola " <> leerNombre()
  end

  def leerNombre do
    IO.gets "Escribe tu nombre: "
  end

end

Saludo.hola()
