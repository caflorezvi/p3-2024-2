# Elixir

<img src="https://i.imgur.com/DURjcwY.png" width="300" > <br> https://elixir-lang.org/</img>

Elixir es un lenguaje de programación funcional y concurrente creado en 2012 por **Jose Valim** (egresado de la Universidad de São Pablo Brasil) y otros colaboradores. Los programas creados en Elixir se ejecutan en la máquina virtual de Erlang (BEAM).

Elixir es ideal para situaciones y tipos de proyectos que requieren: **rendimiento**, **concurrencia** (uso del paralelismo para diseñar y construir sistemas que resuelven problemas), **tolerancia a fallos** y **alta escalabilidad**. Especialmente en sistemas en donde la disponibilidad y la capacidad de respuesta son críticas. Por ejemplo:

- **Aplicaciones Web en tiempo real**: Elixir junto con un *framework* llamado **Phoenix** permiten construir aplicaciones web en tiempo real como: chats, tableros de control en tiempo real (*Dashboard*), juegos en línea.

- **Sistemas distribuidos**: Elixir es ideal para este tipo de sistemas debido a su modelo de concurrencia basado en actores (bloques independientes en ejecución en paralelo que se comunican mediante el envío y recepción de mensajes) y capacidad para escalar vertical y horizontalmente.

- **Procesamiento de eventos**: ideal para aplicaciones que manejan un grandes volúmenes de eventos como: registros de servidores, análisis de datos en tiempo real o sistemas de telemetría. Elixir también ofrece capacidad para manejar múltiples flujos de eventos de manera eficiente.


- **Internet de las cosas (IoT *Internet of Things*)**): Elixir es un lenguaje liviano y eficiente en recursos, lo que lo hace adecuado para aplicaciones en donde se necesitan sistemas que puedan manejar grandes cantidades de dispositivos y comunicaciones en tiempo real.

- **Aplicaciones de mensajería y *chatbots***: La concurrencia y la capacidad de manejar múltiples conexiones simultáneamente hacen que Elixir sea una opción adecuada para este tipo de sistemas. Un buen ejemplo creado en Elixir es la aplicación de **Whatsapp**.

Ejemplos de compañías quu usan Elixir puede ser consultado en la página oficial: https://elixir-lang.org/cases.html


## Paradigma funcional

El paradigma funcional hace parte del paradigma declarativo. En este paradigma las funciones toman un papel importante y el desarrollo se centra principalmente en el QUÉ, en lugar del CÓMO como sucede en los lenguajes del paradigma imperativo.

Las funciones en este tipo de paradigma pueden ser asignadas a variables, incluyendo los parámetros de las funciones. Esto permite la creación de funciones de orden superior, es decir, funciones que toman una o varias funciones como entrada e incluso pueden devolver funciones como salida.

OOtras características de este paradigma son:

- La **inmutabilidad**, lo que significa que una vez se ha creado un dato, no se puede ser modificado, en su lugar, se crea un nuevo dato con los cambios solicitado. Esto tiene importancia en los sistemas paralelos y distribuidos.

- La **evaluación perezosa** las expresiones no se evalúan hasta que su valor es solicitado por el programa. Lo cual mejora la eficiencia.

- La **recursión** técnica utilizada para iterar sobre estructuras de datos, en lugar de usar ciclos iterativos (Aunque Elixir presenta "ciclos" al programador, pero internamente se usa la recursión). 








