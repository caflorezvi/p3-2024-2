defmodule Apoyo do 

    def ingresar_texto(mensaje) do
        IO.gets(mensaje)
        |> String.trim
    end

    def mostrar_mensaje(mensaje) do
        IO.puts(mensaje)
    end
end


nombre = Apoyo.ingresar_texto("Ingrese su nombre: ")
Apoyo.mostrar_mensaje("Hola #{nombre}")