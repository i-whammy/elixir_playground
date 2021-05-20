defmodule Spawn2 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello, #{msg}"}
        greet
    end
  end
end

pid = spawn(Spawn2, :greet, [])

send pid, {self, "World!"}

receive do
  {:ok, value} ->
    IO.puts value
end

send pid, {self, "Kermit!"}
receive do
  {:ok, value} ->
    IO.puts value
  after 500 ->
    IO.puts "The greeter has gone away"
end
