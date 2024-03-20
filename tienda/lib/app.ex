tienda = Tienda.inicializar()

producto1 = %Producto{nombre: "Cerveza", precio: 100, cantidad: 10}
producto2 = %Producto{nombre: "Vino", precio: 200, cantidad: 5}

tienda_con_producto1 = Tienda.agregar_producto(tienda, producto1)
tienda_con_producto2 = Tienda.agregar_producto(tienda_con_producto1, producto2)

productos = Tienda.listar_productos(tienda_con_producto2)
IO.inspect(productos)

productoBuscado = Tienda.buscar_producto(tienda_con_producto2, "Cerveza")
IO.inspect(productoBuscado)
