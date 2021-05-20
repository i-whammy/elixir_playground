defmodule MultiProcesses do
  def call() do
    receive do
      {sender, msg} ->
        send sender, { :ok, "Hello, #{msg}" }
        call
    end
  end
end

spawn(MultiProcesses, :call, [])
|> send({self, "Alex"})
receive do
  { :ok, message} ->
    IO.puts message
end

spawn(MultiProcesses, :call, [])
|> send({self, "Bob"})

receive do
  { :ok, message} ->
    IO.puts message
end
