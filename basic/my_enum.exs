defmodule MyEnum do
  def all?(list, fun) do
    _all?(list, fun, true)
  end

  defp _all?([], _, result) do
    result
  end

  defp _all?([head | tail], fun, result) do
    _all?(tail, fun, fun.(head) && result)
  end

  def each(enumerable, fun) do
    _invoke(enumerable, fun)
  end

  defp _invoke([head | []], fun) do
    fun.(head)
  end

  defp _invoke([head | tail], fun) do
    fun.(head)
    _invoke(tail, fun)
  end

  def filter(enumerable, fun) do
    _filter(enumerable, [], fun)
  end

  defp _filter([], result, _) do
    result
  end

  defp _filter([head | tail], result, fun) do
    if fun.(head) do
      _filter(tail, result ++ [head], fun)
    else
      _filter(tail, result, fun)
    end
  end

  def split(list, count) when count >= length(list) do
    {list, []}
  end

  def split(list, count) when count <= length(list) * -1 do
    {[], list}
  end

  def split(list, count) when count < 0 do
    split(list, Enum.count(list) - abs(count))
  end

  def split(list, count) when count == 0 do
    {[], list}
  end

  def split([head | tail], count) when count == 1 do
    {[head], tail}
  end

  def split([head | tail], count) do
    {_split(tail, count - 1, [head]), }
  end

  defp _split(_, 0, acc) do
    acc
  end

  defp _split([head | tail], count, acc) do
    Enum.concat(acc, head)
  end
end
