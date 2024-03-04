nombre =
  "Ingrese nombre: "
  |> IO.gets()
  |> String.trim()

"Hola #{nombre}"
|> IO.puts()
