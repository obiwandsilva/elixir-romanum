defmodule Romanum do
    defmodule Validator do
        def is_valid_roman(value) do
            if String.length(value) > 14 do
                false
            else
                value
                |> String.upcase
                |> (fn upcased -> Regex.run(~r/[^IVXLCDM]/i, upcased) end).()
                |> (fn match -> !match || false end).()
            end
        end

        def is_valid_decimal(value) do
            String.length(value) < 5
            && !Regex.run(~r/\D/, value)
            && String.to_integer(value) <= 3000
            && String.to_integer(value) > 0
        end
    end

    def convert(value) do
        cond do
            Validator.is_valid_roman(value) -> Converter.convert(value)
            Validator.is_valid_decimal(value) -> Converter.convert(String.to_integer(value))
            true -> nil
        end
    end
end
