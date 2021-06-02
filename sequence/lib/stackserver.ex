defmodule StackServer do
  use GenServer

  def handle_call(:pop, _from, current) do
    {element, current} = List.pop_at(current, 0)
    { :reply, element, current }
  end

  def handle_call({:reset, list}, _from, _list) do
    { :reply, list, list }
  end

  def handle_cast({:push, element}, list) do
    { :noreply, [element] ++ list }
  end
end
