defmodule Link1 do

  def sad_function do
    :timer.sleep 500
    exit(:boom)
  end

  def run do
    spawn(Link1, sad_function(), [])
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    after 1000 ->
      IO.puts "Nothing happened"
    end
  end
end
