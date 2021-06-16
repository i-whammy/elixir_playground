defmodule Disctionary do
  @name __MODULES__

  def start_link do
    Agent.start_link(fn -> %{} end, name: @name)
  end

  def add_words(words) do
    Agent.update(@name, Enum.reduce(words, map, add_one_word()))
  end
end
