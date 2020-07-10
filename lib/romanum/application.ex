defmodule Romanum.Application do
    use Application

    def start(_type, _args) do
        IO.puts("Starting Romanum...")
        timeout = 180000

        task = Task.async(&Input.ask/0)
        Task.await(task, timeout)
        
        {:ok, task.pid}
    end
end
