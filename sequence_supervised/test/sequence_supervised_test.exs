defmodule SequenceSupervisedTest do
  use ExUnit.Case
  doctest SequenceSupervised

  test "greets the world" do
    assert SequenceSupervised.hello() == :world
  end
end
