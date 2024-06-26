defmodule BusquedaConcurrente do
  @moduledoc """
    Módulo que contiene funciones para buscar un número en una lista de forma concurrente.
  """

  @doc """
    Crea una lista con elementos del 1 al número de elementos especificado.
  """
  def crear_lista(numeros), do: 1..numeros |> Enum.to_list()

  @doc """
    Busca un número en una lista de forma concurrente.
  """
  def buscar_numero_v1(lista, numero) do

    # Se divide la lista en cuatro partes
    partes = Enum.chunk_every(lista, div(length(lista), 4))

    # Por cada parte se crea una tarea que buscará el número
    tareas = partes
    |> Enum.map( fn parte -> Task.async( fn -> buscar_parte(parte, numero) end ) end )

    # Se calcula el tiempo de ejecución y se espera a que todas las tareas finalicen
    {tiempo, respuesta} = :timer.tc(fn ->
      # Se espera a que todas las tareas finalicen y se obtiene el resultado de cada una
      resultado = tareas |> Enum.map( &Task.await/1 )
      # Se devuelve true si el número se encuentra en alguna parte de la lista.
      Enum.any?(resultado)
    end)

    IO.puts("Tiempo de ejecución con concurrencia (sin interrupción): #{tiempo/1000000} segundos")
    respuesta

  end

  @doc """
    Busca un número en una parte de una lista. Devuelve true si el número se encuentra en la parte.
  """
  def buscar_parte(parte, numero), do: Enum.member?(parte, numero)

  @doc """
    Busca un número en una lista de forma concurrente, utilizando un supervisor para detener las tareas que no encuentren el número.
  """
  def buscar_numero_v2(lista, numero) do

    # Se divide la lista en cuatro partes
    partes = Enum.chunk_every(lista, div(length(lista), 4))

    # Se crea un supervisor para las tareas
    supervisor = self()

    # Por cada parte se crea una tarea que buscará el número y enviará un mensaje al supervisor si lo encuentra
    tareas = Enum.map(partes, fn parte ->
      Task.async( fn ->
        existe = buscar_parte(parte, numero)
        send(supervisor, {:encontrado, existe, self()})
      end )
    end )

    # Se calcula el tiempo de ejecución y se espera a que una de las tareas envíe un mensaje al supervisor
    {tiempo, respuesta} = :timer.tc(fn ->
      esperar_respuesta(tareas, length(tareas))
    end)

    IO.puts("Tiempo de ejecución con concurrencia (con interrupción): #{tiempo/1000000} segundos")
    respuesta
  end

  @doc """
    Espera a que una de las tareas envíe un mensaje al supervisor. Si la tarea encuentra el número, se detienen las demás tareas.
  """
  def esperar_respuesta(_tareas, 0), do: false

  def esperar_respuesta(tareas, tareas_restantes) do

    # Se recibe el mensaje de la primera tarea que encuentre el número y se detienen las demás
    receive do
      {:encontrado, true, _pid} ->
        # Se detienen las tareas que no encontraron el número
        # Enum.each(tareas, fn tarea -> if tarea.pid != pid, do: Task.shutdown(tarea) end)
        true
      {:encontrado, false, _pid} ->
        # Se espera a que las demás tareas finalicen
        esperar_respuesta(tareas, tareas_restantes - 1)
    end

  end

end

defmodule Main do

  def run do
    numero = 2500002
    lista = BusquedaConcurrente.crear_lista(10000000)

    {tiempo, resp1} = :timer.tc(fn ->
      BusquedaConcurrente.buscar_parte(lista, numero)
    end)

    IO.puts("Tiempo de ejecución sin concurrencia: #{tiempo/1000000} segundos")

    resp2 = BusquedaConcurrente.buscar_numero_v2(lista, numero)
    resp3 = BusquedaConcurrente.buscar_numero_v1(lista, numero)

    IO.puts("Sin concurrencia, ¿Existe? : #{resp1}")
    IO.puts("Con concurrencia (con interrupción), ¿Existe? : #{resp2}")
    IO.puts("Con concurrencia (sin interrupción), ¿Existe? : #{resp3}")

  end

end

Main.run()
