defmodule Input do
    def ask() do
        input = IO.gets("Enter a valid Roman number\n")
        cleaned = String.replace(input, ~r/(\n|\s)/, "")
    end
end
