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
      {divisor, 2} ->
        send next_pid, rem(divisor, 2) != 0
      {divisor, dividend} ->
        send next_pid, rem(divisor, dividend-1)
    end
  end

  def prime?(number) do
    last = Enum.reduce(number..1, self(),
    fn (_, send_to) ->
      spawn(Prime, :prime, [send_to])
    end)

    send(last, {number, number-1})

    receive do
      result ->
        result
    end

  end

  def hello do
    :world
  end
end
