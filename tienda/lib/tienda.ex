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

  defp buscar_producto_recursivo([producto | _resto], nombre) when producto.nombre == nombre, do: producto
  defp buscar_producto_recursivo([_producto | resto], nombre), do: buscar_producto_recursivo(resto, nombre)
  defp buscar_producto_recursivo([], _nombre), do: nil

  def inicializar() do
    %Tienda{}
  end

end
