# Un defstruct es una estructura de datos que se puede utilizar para almacenar información de manera más organizada.
# Se crea utilizando la macro defstruct y se le pueden definir los campos que se deseen.
# Para acceder a los campos de una estructura se utiliza el operador de punto (.).

defmodule Pokemon do
  defstruct [:id, :nombre, :tipo, :vida, :ataque, :defensa, :velocidad]
end

defmodule Main do

  def run do

    # Crear un nuevo Pokemon
    pikachu = %Pokemon{id: 25, nombre: "Pikachu", tipo: "Eléctrico", vida: 35, ataque: 55, defensa: 40, velocidad: 90}
    mew = %Pokemon{id: 151, nombre: "Mew", tipo: "Psíquico", vida: 100, ataque: 100, defensa: 100, velocidad: 100}

    # Imprimir los datos de los Pokemon
    IO.puts("Datos de Pikachu:")
    IO.inspect(pikachu)

    IO.puts("Datos de Mew:")
    IO.inspect(mew)

    IO.puts("--------------------")

    # Acceder a los campos de un Pokemon
    IO.puts("Tipo de Pikachu: #{pikachu.tipo}")
    IO.puts("Tipo de Mew: #{mew.tipo}")

    IO.puts("--------------------")

    # Actualizar un campo de un Pokemon
    pikachu = %{pikachu | vida: 10}
    IO.puts("Vida de Pikachu actualizada: #{pikachu.vida}")

    IO.puts("--------------------")

    # Crear un nuevo Pokemon a partir de otro
    pikachu2 = %{pikachu | id: 26, nombre: "Pikachu 2"}
    IO.puts("Datos de Pikachu 2:")
    IO.inspect(pikachu2)

    IO.puts("--------------------")

    # Recorrer los campos de un Pokemon
    IO.puts("Campos de Pikachu:")
    pikachu_map = Map.from_struct(pikachu)
    Enum.each(pikachu_map, fn {campo, valor} -> IO.puts("#{campo}: #{valor}") end)

    IO.puts("--------------------")

    # Hacer pattern matching con un Pokemon
    %Pokemon{id: id, nombre: nombre, tipo: tipo} = mew
    IO.puts("Pattern matching - ID: #{id}, Nombre: #{nombre}, Tipo: #{tipo}")

    IO.puts("--------------------")

    # Crear una lista de Pokemon
    pokemones = [pikachu, mew, pikachu2]

    # Obtener los nombres de los Pokemon que sean de tipo "Eléctrico"
    nombres_electricos = Enum.filter(pokemones, fn pokemon -> pokemon.tipo == "Eléctrico" end) |> Enum.map(fn pokemon -> pokemon.nombre end)

    IO.puts("Nombres de los Pokemon de tipo Eléctrico:")
    IO.inspect(nombres_electricos)

  end

end

Main.run()
