# Programación 3 en la Universidad del Quindío.

En este repositorio se encuentra material de apoyo para el espacio académico de Programación 3 (Programación Funcional) en la Universidad del Quindío programado para el 2024-2.


# Autores

- Carlos Andrés Flórez Villarraga (caflorez@uniquindio.edu.co)
- Julián Esteban Gutiérrez Posada (jugutier@uniquindio.edu.co)

# Herramientas

- [Elixir 1.16.1](https://elixir-lang.org/)
    - Erlang/OTP 26 *(incluido con Elixir)*.

- [Visual Studio Code 1.82.2](https://code.visualstudio.com/)
    - Con las siguientes extensiones:
        - vscode-elixir v1.1.0
        - ElixirLS: Elixir support and debugger v0.20.0
        - Elixir Formatter v1.3.0
- [Git 2.44.0](https://git-scm.com/)


# Ejecutar un programa interpretado (*script*) en Elixir  

Para ejecutar un *script* creado en Elixir basta con ejecutar

```shell
elixir nombre.exs
```

Observe que la extensión del script es (**.exs**) que denota **Elixir Script**. Los *Scripts* tiene la particularidad de que no requieren ser compilados para ser ejecutados, lo que los hace más versátiles pero un poco más lentos.


# Ejecutar un programa compilado en Elixir  


Para ejecutar un programa creado en Elixir basta con ejecutar

```shell
elixir nombre.ex
```
Ahora note que la extensión ha cambiado a **.ex**. Los programas a diferencia los de los *Scripts* deben ser compilados (traducidos a un código binario, para este caso, para la máquina virtual de **Erlang**).

Los programas compilados son más rápidos a la hora de ser ejecutados que los *scripts*, pero al mismo tiempo, pierden algo de flexibilidad. 


# Crear un nuevo proyecto

Lo ideal para crear un proyecto nuevo para Elixir es usar la herramienta **mix** desde la terminal.

```shell
mix new ejemplo001
```

Observe que el nombre del proyecto (*ejemplo001*) debe estar en minúsculas.

Luego debe ingresar a la carpeta creada con ese nombre.

```shell
cd ejemplo001
```
y una vez allí podemos:

## Ejecutar las pruebas generadas con el ejemplo

Para compilar el proyecto puede usar el comando:

```shell
mix test
```

## Compilar y ejecutar el ejemplo generado

Para compilar el proyecto puede usar el comando:

```shell
mix run
```



