defmodule Chop do
  def guess(actual, (first..last)) do
    current = div(first + last, 2)
    IO.puts("Is it #{current}")
    _guess(actual, first..last, current)
  end

  defp _guess(actual, _, current) when actual == current do
    actual
  end

  defp _guess(actual, first.._, current) when actual < current do
    guess(actual, first..current)
  end

  defp _guess(actual, _..last, current) do
    guess(actual, current..last)
  end
end
