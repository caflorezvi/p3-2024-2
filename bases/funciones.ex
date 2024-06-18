# Funcines anónimas

suma = fn a, b -> a+b end # fn es una palabra reservada para definir una función anónima
# suma = fn (a, b) -> a+b end # También se puede definir así
IO.puts( suma.(1, 2) ) # 3

# Función anónima usando el operador &

suma = &(&1 + &2) # &1 y &2 son los argumentos de la función anónima
IO.puts( suma.(1, 2) ) # 3

IO.puts("--------------------")

# Funciones con nombre

defmodule Funciones do

  @moduledoc """
    Módulo que contiene funciones matemáticas. Un módulo es un contenedor de funciones y datos.
  """
  @doc """
    Función que suma dos números. La última expresión de una función es su valor de retorno.
  """
  def suma(a, b) do
    a + b
  end

  @doc """
    Función que devuelve un saludo con el nombre que se le pase como argumento. Se usa la concatenación de cadenas.
  """
  def saludo_v1(nombre) do
    "Hola " <> nombre
  end

  @doc """
    Función que devuelve un saludo con el nombre que se le pase como argumento. Se usa función en una línea, para ello se usa la palabra clave do:.
  """
  def saludo_v2(nombre), do: "Hola " <> nombre

  @doc """
    Función que divide dos números y devuelve el cociente y el residuo. Se usa la función div y rem respectivamente. Se usa la tupla para devolver dos valores.
  """
  def dividir_v1(a, b) do
    cociente = div(a, b)
    residuo = rem(a, b)
    {cociente, residuo}
  end

  @doc """
    Función que divide dos números y devuelve el cociente y el residuo. Se usa el pattern matching para devolver un error si el divisor es cero.
  """
  def dividir_v2(a, b) do
    case b do
      0 -> {:error, "No se puede dividir por cero"}
      _ -> {:ok, {div(a, b), rem(a, b)}}
    end
  end

  @doc """
    Función que devuelve un saludo con el nombre que se le pase como argumento. Se usa la interpolación de cadenas.
  """
  def saludo_jornada(nombre) do
    # Se obtiene la hora actual con la función local_time del módulo Calendar.
    hora_actual = :calendar.local_time
    # Se usa el pattern matching para obtener la hora actual y se usa el case para devolver un saludo según la hora.
    case hora_actual do
      {_, {hora, _, _}} when hora >= 0 and hora < 12 -> "Buenos días #{nombre}"
      {_, {hora, _, _}} when hora >= 12 and hora < 19 -> "Buenas tardes #{nombre}"
      {_, {hora, _, _}} when hora >= 19 and hora < 24 -> "Buenas noches #{nombre}"
    end
  end

  @doc """
    Función que pide un valor al usuario y lo muestra en pantalla. Se usa la función IO.gets para obtener el valor y la función IO.puts para mostrarlo.
  """
  def ingresar_valor do
    # Se usa la función IO.gets para obtener el valor y la función String.trim para quitar los espacios en blanco. El operador |> se usa para pasar el resultado de una función a otra.
    valor = IO.gets("Ingrese un valor: ") |> String.trim()
    IO.puts("El valor ingresado es: #{valor}")
  end

  @doc """
    Función que indica el rango de edad según la edad que se le pase como argumento. Se usa cond para definir condiciones.
  """
  def indicar_rango_edad_case(edad) do
    cond do
      edad >= 0 and edad < 18 -> "Menor de edad"
      edad >= 18 and edad < 65 -> "Mayor de edad"
      edad >= 65 -> "Adulto mayor"
    end
  end

  @doc """
    Función que indica el rango de edad según la edad que se le pase como argumento. Se usa el pattern matching para devolver un rango de edad. Se usa la palabra clave when para definir condiciones.
  """
  def indicar_rango_edad(edad) when edad >= 0 and edad < 18 do
    "Menor de edad"
  end

  def indicar_rango_edad(edad) when edad >= 18 and edad < 65 do
    "Mayor de edad"
  end

  def indicar_rango_edad(edad) when edad >= 65 do
    "Adulto mayor"
  end

end

defmodule Loteria do
  @moduledoc """
    Módulo que contiene funciones de ejemplo. Una función privada no puede ser llamada desde fuera del módulo. Se usa la palabra clave defp para definir una función privada.
  """

  @doc """
    Función que valida si un número ingresado por el usuario es igual al número de la lotería. Se usa la función leer_numero para obtener el número ingresado por el usuario. Se usa el pattern matching para comparar el número ingresado con el número de la lotería.
  """
  def validar_numero do
    loteria = :rand.uniform(100)
    numero = leer_numero()

    # Se usa el pattern matching para comparar el número ingresado con el número de la lotería.
    case numero do
      ^loteria -> IO.puts("¡Felicidades! Has ganado la lotería.")
      _ -> IO.puts("Lo siento, no has ganado la lotería. El número ganador era #{loteria}.")
    end
  end

  defp leer_numero do

    # Se usa la función IO.gets para obtener el valor y la función String.trim para quitar los espacios en blanco. El operador |> se usa para pasar el resultado de una función a otra.
    valor = "Ingrese un número entre 0 y 100: " |> IO.gets |> String.trim

    # Se usa la función Integer.parse para convertir el valor a un número entero. El case se usa para hacer coincidencia de patrones.
    case Integer.parse(valor) do
      {n, _} when n in 0..100 ->
        n
      {n, _} ->
        IO.puts("El número #{n} no es válido, debe estar entre 0 y 100.")
        leer_numero()
      :error ->
        IO.puts("El valor ingresado no es un número válido.")
        leer_numero()
    end
  end

end

defmodule FuncionesOrdenSuperior do
  @moduledoc """
    Módulo que contiene funciones de orden superior. Una función de orden superior es una función que toma una o más funciones como argumentos y/o devuelve una función como resultado.
  """

  @doc """
    Función que aplica una operación a dos números. Se usa el concepto de función de orden superior. La función aplicar_operacion toma dos números y una función como argumentos y devuelve el resultado de aplicar la función a los dos números.
  """
  def aplicar_operacion(a, b, operacion) do
    operacion.(a, b)
  end

  def sumar(a, b), do: a + b
  def multiplicar(a, b), do: a * b

end

# Llamando a la función suma del módulo Funciones
IO.puts( Funciones.suma(1, 2) ) # 3

# Llamando a la función saludo_v1 del módulo Funciones
IO.puts( Funciones.saludo_v1("Carlos") ) # Hola Carlos

# Llamando a la función de dividir del módulo Funciones usando pattern matching. El patrón {cociente, residuo} se usa para desestructurar la tupla que devuelve la función.
{cociente, residuo} = Funciones.dividir_v1(10, 3)
IO.puts( "El cociente de la división de 10/3 es: #{cociente} y el residuo es #{residuo}") # 3

# Llamando a la función de dividir del módulo Funciones usando pattern matching. El patrón {:ok, {cociente, residuo}} se usa para desestructurar la tupla que devuelve la función.
case Funciones.dividir_v2(10, 0) do
  {:ok, {cociente, residuo}} -> IO.puts( "El cociente de la división de 10/3 es: #{cociente} y el residuo es #{residuo}")
  {:error, mensaje} -> IO.puts( mensaje )
end

# Llamando a la función saludo_jornada del módulo Funciones
IO.puts( Funciones.saludo_jornada("Carlos") ) # Buenos días Carlos

# Llamando a la función ingresar_valor del módulo Funciones
Funciones.ingresar_valor

# Llamando a la función indicar_rango_edad del módulo Funciones
IO.puts( Funciones.indicar_rango_edad(10) ) # Menor de edad

# Llamando a la función validar_numero del módulo Loteria
Loteria.validar_numero

# Llamando a la función aplicar_operacion del módulo FuncionesOrdenSuperior
resultado = FuncionesOrdenSuperior.aplicar_operacion(2, 3, &FuncionesOrdenSuperior.sumar/2)
IO.puts( "El resultado de la suma de 2 y 3 es: #{resultado}" ) # 5
