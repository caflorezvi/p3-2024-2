defmodule Tienda do

  defstruct productos: []

  def agregar_producto(tienda, producto) do
    %{tienda | productos: [producto | tienda.productos]}
  end

  def listar_productos(tienda) do
    tienda.productos
  end

  def buscar_producto(tienda, nombre) do
    buscar_producto_recursivo(tienda.productos, nombre)
  end

  defp buscar_producto_recursivo([producto | rest], nombre) do
    if producto.nombre == nombre do
      producto
    else
      buscar_producto_recursivo(rest, nombre)
    end
  end

  defp buscar_producto_recursivo([], _nombre), do: nil

  def inicializar() do
    %Tienda{}
  end

end
