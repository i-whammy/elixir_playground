defmodule ControlFlow do
  def ok!({:ok, data}) do
    data
  end

  def ok!(x) do
    raise "Error :#{x}"
  end
end
