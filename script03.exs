IO.gets("Ingrese nombre: ")
|> String.trim
|> (&("Hola #{&1}")).()
|> IO.puts 