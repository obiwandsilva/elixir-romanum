defmodule Romanum do
    defmodule Validator do
        def is_valid_roman(value) do
            if String.length(value) > 14 do
                false
            else
                !Regex.run(~r/[^IVXLCDM]/i, value)
                || false
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
            String.length(value) == 0 -> nil
            Validator.is_valid_roman(value) -> Converter.from_roman(value)
            Validator.is_valid_decimal(value) -> Converter.to_roman(value)
            true -> nil
        end
    end
end
