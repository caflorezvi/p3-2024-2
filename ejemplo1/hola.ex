defmodule Saludo do
  def hola(nombre) do
    IO.puts "Hola " <> nombre
  end
end

Saludo.hola("Pepito")
