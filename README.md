# Crear un proyecto para una biblioteca

# Crear un nuevo proyecto

Lo ideal para crear un proyecto nuevo para Elixir es usar la herramienta **mix** desde la terminal.

```shell
mix new ejebiblioteca
```

Observe que el nombre del proyecto (*ejemplo001*) debe estar en minúsculas.

Luego debe ingresar a la carpeta creada con ese nombre.

```shell
cd ejebiblioteca
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

## Ejecutar el ejemplo de forma interactiva

Para poder ejecutar de forma interactiva usando (ies)
se debe usar:

```shell
iex -S mix
```
Una vez dentro de (ies) puede invocar las funciones del proyecto, por ejemplo:

```shell
iex(1)> Ejebiblioteca.hello()
:world
```

## Consultar las opciones disponibles de mix

```shell
mix help
```

Obteniendo un resultado como:

```shell
mix                   # Runs the default task (current: "mix run")
mix app.config        # Configures all registered apps
mix app.start         # Starts all registered apps
mix app.tree          # Prints the application tree
mix archive           # Lists installed archives
mix archive.build     # Archives this project into a .ez file
mix archive.install   # Installs an archive locally
mix archive.uninstall # Uninstalls archives
mix clean             # Deletes generated application files
mix cmd               # Executes the given command
mix compile           # Compiles source files
mix deps              # Lists dependencies and their status
mix deps.clean        # Deletes the given dependencies' files
mix deps.compile      # Compiles dependencies
mix deps.get          # Gets all out of date dependencies
mix deps.tree         # Prints the dependency tree
mix deps.unlock       # Unlocks the given dependencies
mix deps.update       # Updates the given dependencies
mix do                # Executes the tasks separated by plus
mix escript           # Lists installed escripts
mix escript.build     # Builds an escript for the project
mix escript.install   # Installs an escript locally
mix escript.uninstall # Uninstalls escripts
mix eval              # Evaluates the given code
mix format            # Formats the given files/patterns
mix help              # Prints help information for tasks
mix hex               # Prints Hex help information
mix hex.audit         # Shows retired Hex deps for the current project
mix hex.build         # Builds a new package version locally
mix hex.config        # Reads, updates or deletes local Hex config
mix hex.docs          # Fetches or opens documentation of a package
mix hex.info          # Prints Hex information
mix hex.organization  # Manages Hex.pm organizations
mix hex.outdated      # Shows outdated Hex deps for the current project
mix hex.owner         # Manages Hex package ownership
mix hex.package       # Fetches or diffs packages
mix hex.publish       # Publishes a new package version
mix hex.registry      # Manages local Hex registries
mix hex.repo          # Manages Hex repositories
mix hex.retire        # Retires a package version
mix hex.search        # Searches for package names
mix hex.sponsor       # Show Hex packages accepting sponsorships
mix hex.user          # Manages your Hex user account
mix loadconfig        # Loads and persists the given configuration
mix local             # Lists tasks installed locally via archives
mix local.hex         # Installs Hex locally
mix local.public_keys # Manages public keys
mix local.rebar       # Installs Rebar locally
mix new               # Creates a new Elixir project
mix profile.cprof     # Profiles the given file or expression with cprof
mix profile.eprof     # Profiles the given file or expression with eprof
mix profile.fprof     # Profiles the given file or expression with fprof
mix release           # Assembles a self-contained release
mix release.init      # Generates sample files for releases
mix run               # Runs the current application
mix test              # Runs a project's tests
mix test.coverage     # Build report from exported test coverage
mix xref              # Prints cross reference information
iex -S mix            # Starts IEx and runs the default task
```



# Crear un proyecto para una aplicación

Para esto, se debe crear un proyecto normal

```shell
mix new ejeapp --sup
```

```shell
* creating README.md
* creating .formatter.exs
* creating .gitignore
* creating mix.exs
* creating lib
* creating lib/ejeapp.ex
* creating lib/ejeapp/application.ex
* creating test
* creating test/test_helper.exs
* creating test/ejeapp_test.exs

Your Mix project was created successfully.
You can use "mix" to compile it, test it, and more:

    cd ejeapp
    mix test

Run "mix help" for more commands.
```

En donde **--sup** significa con un árbol de supervisión.


y verificar que el archivo ***mix.exs** y observe que ahora se define **application**

Por ejemplo:

```elixir
  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Ejeapp.Application, []}
    ]
  end
```

Además observe que dentro de la carpeta **lib** se creó una carpeta llamada **ejeapp** que contiene un programa en Elixir llamado **application.ex**.



```elixir
defmodule Ejeapp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Ejeapp.Worker.start_link(arg)
      # {Ejeapp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ejeapp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
```


## Compilar y generar una versión (release) autocontenida

```shell
mix release
```
Y lo ejecutamos usando ies

```shell
_build/dev/rel/ejeapp/bin/ejeapp start
```


# Crear una aplicación Web usando *Framework **Phoenix*** (https://www.phoenixframework.org/)

## Instalar el *framework **Phoenix***

Antes debemos instalar el *framework*, una vez hecho esto, se puede usar la herramienta **mix** para crear un proyecto **Phoenix**.


```shell
mix archive.install hex phx_new
```

```shell
Resolving Hex dependencies...
Resolution completed in 0.015s
New:
  phx_new 1.7.11
* Getting phx_new (Hex package)
All dependencies are up to date
Compiling 11 files (.ex)
Generated phx_new app
Generated archive "phx_new-1.7.11.ez" with MIX_ENV=prod
Are you sure you want to install "phx_new-1.7.11.ez"? [Yn] 
* creating /home/jugutier/.mix/archives/phx_new-1.7.11
```

Observe como ahora la herramienta **mix** ya tiene más opciones:

```shell
mix help
```

```shell
mix                   # Runs the default task (current: "mix run")
mix app.config        # Configures all registered apps
mix app.start         # Starts all registered apps
mix app.tree          # Prints the application tree
mix archive           # Lists installed archives
mix archive.build     # Archives this project into a .ez file
mix archive.install   # Installs an archive locally
mix archive.uninstall # Uninstalls archives
mix clean             # Deletes generated application files
mix cmd               # Executes the given command
mix compile           # Compiles source files
mix deps              # Lists dependencies and their status
mix deps.clean        # Deletes the given dependencies' files
mix deps.compile      # Compiles dependencies
mix deps.get          # Gets all out of date dependencies
mix deps.tree         # Prints the dependency tree
mix deps.unlock       # Unlocks the given dependencies
mix deps.update       # Updates the given dependencies
mix do                # Executes the tasks separated by plus
mix escript           # Lists installed escripts
mix escript.build     # Builds an escript for the project
mix escript.install   # Installs an escript locally
mix escript.uninstall # Uninstalls escripts
mix eval              # Evaluates the given code
mix format            # Formats the given files/patterns
mix help              # Prints help information for tasks
mix hex               # Prints Hex help information
mix hex.audit         # Shows retired Hex deps for the current project
mix hex.build         # Builds a new package version locally
mix hex.config        # Reads, updates or deletes local Hex config
mix hex.docs          # Fetches or opens documentation of a package
mix hex.info          # Prints Hex information
mix hex.organization  # Manages Hex.pm organizations
mix hex.outdated      # Shows outdated Hex deps for the current project
mix hex.owner         # Manages Hex package ownership
mix hex.package       # Fetches or diffs packages
mix hex.publish       # Publishes a new package version
mix hex.registry      # Manages local Hex registries
mix hex.repo          # Manages Hex repositories
mix hex.retire        # Retires a package version
mix hex.search        # Searches for package names
mix hex.sponsor       # Show Hex packages accepting sponsorships
mix hex.user          # Manages your Hex user account
mix loadconfig        # Loads and persists the given configuration
mix local             # Lists tasks installed locally via archives
mix local.hex         # Installs Hex locally
mix local.phx         # Updates the Phoenix project generator locally
mix local.public_keys # Manages public keys
mix local.rebar       # Installs Rebar locally
mix new               # Creates a new Elixir project
mix phx.new           # Creates a new Phoenix v1.7.11 application
mix phx.new.ecto      # Creates a new Ecto project within an umbrella project
mix phx.new.web       # Creates a new Phoenix web project within an umbrella project
mix profile.cprof     # Profiles the given file or expression with cprof
mix profile.eprof     # Profiles the given file or expression with eprof
mix profile.fprof     # Profiles the given file or expression with fprof
mix release           # Assembles a self-contained release
mix release.init      # Generates sample files for releases
mix run               # Runs the current application
mix test              # Runs a project's tests
mix test.coverage     # Build report from exported test coverage
mix xref              # Prints cross reference information
iex -S mix            # Starts IEx and runs the default task
```

## Creando un nuevo proyecto **Phoenix**

```shell
mix phx.new ejeweb 
```

```shell
* creating ejeweb/lib/ejeweb/application.ex
* creating ejeweb/lib/ejeweb.ex
* creating ejeweb/lib/ejeweb_web/controllers/error_json.ex
* creating ejeweb/lib/ejeweb_web/endpoint.ex
* creating ejeweb/lib/ejeweb_web/router.ex
* creating ejeweb/lib/ejeweb_web/telemetry.ex
* creating ejeweb/lib/ejeweb_web.ex
* creating ejeweb/mix.exs
* creating ejeweb/README.md
* creating ejeweb/.formatter.exs
* creating ejeweb/.gitignore
* creating ejeweb/test/support/conn_case.ex
* creating ejeweb/test/test_helper.exs
* creating ejeweb/test/ejeweb_web/controllers/error_json_test.exs
* creating ejeweb/lib/ejeweb/repo.ex
* creating ejeweb/priv/repo/migrations/.formatter.exs
* creating ejeweb/priv/repo/seeds.exs
* creating ejeweb/test/support/data_case.ex
* creating ejeweb/lib/ejeweb_web/controllers/error_html.ex
* creating ejeweb/test/ejeweb_web/controllers/error_html_test.exs
* creating ejeweb/lib/ejeweb_web/components/core_components.ex
* creating ejeweb/lib/ejeweb_web/controllers/page_controller.ex
* creating ejeweb/lib/ejeweb_web/controllers/page_html.ex
* creating ejeweb/lib/ejeweb_web/controllers/page_html/home.html.heex
* creating ejeweb/test/ejeweb_web/controllers/page_controller_test.exs
* creating ejeweb/lib/ejeweb_web/components/layouts/root.html.heex
* creating ejeweb/lib/ejeweb_web/components/layouts/app.html.heex
* creating ejeweb/lib/ejeweb_web/components/layouts.ex
* creating ejeweb/priv/static/images/logo.svg
* creating ejeweb/lib/ejeweb/mailer.ex
* creating ejeweb/lib/ejeweb_web/gettext.ex
* creating ejeweb/priv/gettext/en/LC_MESSAGES/errors.po
* creating ejeweb/priv/gettext/errors.pot
* creating ejeweb/priv/static/robots.txt
* creating ejeweb/priv/static/favicon.ico
* creating ejeweb/assets/js/app.js
* creating ejeweb/assets/vendor/topbar.js
* creating ejeweb/assets/css/app.css
* creating ejeweb/assets/tailwind.config.js

Fetch and install dependencies? [Yn] 
* running mix deps.get
* running mix assets.setup
* running mix deps.compile

We are almost there! The following steps are missing:

    $ cd ejeweb

Then configure your database in config/dev.exs and run:

    $ mix ecto.create

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
```

Observe que por defecto, se requiere de la base de datos llamada **PostgreSQL**, aunque es posible configurar Elixir para cambiar de motor de bases de datos, o incluso crear un proyecto web que no requiera base de datos.


## Creando un nuevo proyecto **Phoenix** (que no necesata de un motor de bases de datos)


```shell
mix phx.new ejeweb2 --no-ecto
```

```shell
* creating ejeweb2/lib/ejeweb2/application.ex
* creating ejeweb2/lib/ejeweb2.ex
* creating ejeweb2/lib/ejeweb2_web/controllers/error_json.ex
* creating ejeweb2/lib/ejeweb2_web/endpoint.ex
* creating ejeweb2/lib/ejeweb2_web/router.ex
* creating ejeweb2/lib/ejeweb2_web/telemetry.ex
* creating ejeweb2/lib/ejeweb2_web.ex
* creating ejeweb2/mix.exs
* creating ejeweb2/README.md
* creating ejeweb2/.formatter.exs
* creating ejeweb2/.gitignore
* creating ejeweb2/test/support/conn_case.ex
* creating ejeweb2/test/test_helper.exs
* creating ejeweb2/test/ejeweb2_web/controllers/error_json_test.exs
* creating ejeweb2/lib/ejeweb2_web/controllers/error_html.ex
* creating ejeweb2/test/ejeweb2_web/controllers/error_html_test.exs
* creating ejeweb2/lib/ejeweb2_web/components/core_components.ex
* creating ejeweb2/lib/ejeweb2_web/controllers/page_controller.ex
* creating ejeweb2/lib/ejeweb2_web/controllers/page_html.ex
* creating ejeweb2/lib/ejeweb2_web/controllers/page_html/home.html.heex
* creating ejeweb2/test/ejeweb2_web/controllers/page_controller_test.exs
* creating ejeweb2/lib/ejeweb2_web/components/layouts/root.html.heex
* creating ejeweb2/lib/ejeweb2_web/components/layouts/app.html.heex
* creating ejeweb2/lib/ejeweb2_web/components/layouts.ex
* creating ejeweb2/priv/static/images/logo.svg
* creating ejeweb2/lib/ejeweb2/mailer.ex
* creating ejeweb2/lib/ejeweb2_web/gettext.ex
* creating ejeweb2/priv/gettext/en/LC_MESSAGES/errors.po
* creating ejeweb2/priv/gettext/errors.pot
* creating ejeweb2/priv/static/robots.txt
* creating ejeweb2/priv/static/favicon.ico
* creating ejeweb2/assets/js/app.js
* creating ejeweb2/assets/vendor/topbar.js
* creating ejeweb2/assets/css/app.css
* creating ejeweb2/assets/tailwind.config.js

Fetch and install dependencies? [Yn] 
* running mix deps.get
* running mix assets.setup
* running mix deps.compile

We are almost there! The following steps are missing:

    $ cd ejeweb2

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
```


# Referencias 

## Material base 

### Youtube 

https://www.youtube.com/watch?v=-K74G9nlzSY&list=PLMLox3fRb_I4_4-DnU3yS_EglDAuVpeEg&index=1


### Github

https://github.com/idcmardelplata/curso-elixir