defmodule SupervisorEjemploTest do
  use ExUnit.Case
  doctest SupervisorEjemplo

  test "greets the world" do
    assert SupervisorEjemplo.hello() == :world
  end
end
