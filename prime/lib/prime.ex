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
  def prime(next_pid) do
    receive do
      {divisor, dividend, result} ->
        send next_pid, {divisor, dividend+1, rem(divisor, dividend) != 0 && result}
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

    send(last, {number, 2, true})

    receive do
      {_,_,result} ->
        result
    end

  end
end
