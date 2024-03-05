# EJEMPLO

# Requiere tener el archivo "apoyo.ex" compilado usando el comando
# elixirc apoyo.ex
# No es necesario importarlo, con utilizar Apoyo.xxxx  se le indica a 
# Elixir que la función pertenece al módulo "Apoyo".

nombre =
  "Ingrese su nombre: "
  |> Apoyo.ingresar(:texto)

altura =
  "Ingrese su altura en metros: "
  |> Apoyo.ingresar(:real)

n1 =
  "Ingrese su valor n1: "
  |> Apoyo.ingresar(:entero)

n2 =
  "Ingrese su valor n2: "
  |> Apoyo.ingresar(:entero)

suma = n1 + n2

"Hola #{nombre}, su altura es de #{altura} y la suma de #{n1} con #{n2}  es de #{suma}"
|> Apoyo.mostrar_mensaje()
