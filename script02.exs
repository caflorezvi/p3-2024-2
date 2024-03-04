nombre =
  "Ingrese nombre: "
  |> IO.gets()
  |> String.trim()

IO.puts("Hola #{nombre}")
