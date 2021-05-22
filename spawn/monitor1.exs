defmodule Monitor1 do

  def sad_function do
    :timer.sleep 500
    exit(:boom)
  end

  def run do
    res = spawn_monitor(Monitor1, :sad_function, [])
    Process.flag(:trap_exit, true)
    spawn_link(Link1, sad_function(), [])
    receive do
      msg ->
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    after 1000 ->
      IO.puts "Nothing happened"
    end
  end
end

Monitor1.run
