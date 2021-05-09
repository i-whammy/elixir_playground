defmodule Sum do
  def sum(n), do: _sum(n)

  defp _sum([]), do: 0
  defp _sum([n | []]), do: n
  defp _sum([n | tail]), do: n + sum(tail)

  def gcd(x,0), do: x
  def gcd(x,y), do: gcd(y, rem(x,y))
end