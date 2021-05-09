defmodule MyList do

  def mapsum(list, func) do
    Enum.map(list, func)
    |> _reduce(0, Enum.sum())
  end

  defp _reduce([], value, _) do
    value
  end

  defp _reduce([head | tail], value, func) do
    _reduce(tail, func.(head, value), func)
  end 

end