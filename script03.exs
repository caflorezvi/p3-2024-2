"Ingrese nombre: "
|> IO.gets()
|> String.trim()
|> (&"Hola #{&1}").()
|> IO.puts()
