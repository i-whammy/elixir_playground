defmodule MyList do

  def mapsum(list, func) do
    Enum.map(list, func)
    |> _reduce(0, &(&1 + &2))
  end

  defp _reduce([], value, _) do
    value
  end

  defp _reduce([head | tail], value, func) do
    _reduce(tail, func.(head, value), func)
  end 

  def max([]) do
    0
  end

  def max([head | tail]) do
    _max(tail, head)
  end

  def _max([], max_number) do
    max_number
  end

  def _max([head | tail], max_number) when head >= max_number do
    _max(tail, head)
  end

  def _max([head | tail], max_number) when head < max_number do
    _max(tail, max_number)
  end
end