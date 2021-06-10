defmodule Prime do
  @moduledoc """
  Documentation for `Prime`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Prime.hello()
      :world

  """
  @block 50


  def prime(root) do
    receive do
      {divisor, dividend, result} ->
        send root, {divisor, dividend+1, rem(divisor, dividend) != 0 && result}
    end
  end

  def prime?(number) when number == 2 do
    true
  end

  def prime?(number) do
    last = Enum.reduce(2..number - 1, self(),
    fn (_, send_to) ->
      spawn(Prime, :prime, [send_to])
    end)

    Enum.each(0..@block, fn n ->
      send(last, {number, 2 + n, true})
    end)

    receive do
      {_,_,false} ->
        false
      {divisor, dividend, result} when divisor - dividend >= 50->
        send(last, {divisor, dividend + 50, result})
      {_,_,result} ->
        result
    end

  end
end
