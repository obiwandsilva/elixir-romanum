defmodule Input do

    defp message(nil, source) do
        "#{source} -> Invalid value"
    end
    
    defp message(result, source) do
        "#{source} -> #{result}"
    end

    defp clean(input) do
        input
        |> String.replace(~r/(\n|\s)/, "")
        |> String.upcase
    end

    def ask() do
        input = IO.gets("Enter a valid Roman or decimal number or type 'exit' to quit:\n")
        cleaned = clean(input)

        try do
            if cleaned == "EXIT" do
                IO.puts("Exiting Romanum...")
            else
                Romanum.convert(cleaned)
                |> message(cleaned)
                |> IO.puts
                
                ask()
            end
        rescue
            error -> IO.puts(error)
        end
    end
end
