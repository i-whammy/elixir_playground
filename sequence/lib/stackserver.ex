defmodule StackServer do
  use GenServer

  def init(init_arg) do
    {:ok, init_arg}
  end

  def start_link(list) do
    GenServer.start_link(__MODULE__, list, name: :stack)
  end

  def pop do
    GenServer.call :stack, :pop
  end

  def reset(list) do
    GenServer.call :stack, {:reset, list}
  end

  def push(element) do
    GenServer.cast :stack, {:push, element}
  end

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
