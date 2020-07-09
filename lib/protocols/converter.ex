defprotocol Converter do
  def convert(value)
end

defimpl Converter, for: BitString do

    defp eval_char('I', seq, sum) do
        cond do
            seq == '' && sum == 0 -> {1, 'I'}
            seq == 'I' -> {1, 'II'}
            seq == 'II' -> {1, ''}
            sum > 4 -> {1, 'I'}
            true -> raise RomanPositionError
        end
    end

    defp eval_char('V', seq, sum) do
        cond do
            seq == '' && (sum == 0 || sum > 5) -> {5, ''}
            seq == 'I' -> {3, ''}
            sum > 5 -> {5, ''}
            true -> raise RomanPositionError
        end
    end

    defp eval_char('X', seq, sum) do
        cond do
            seq == '' && sum == 0 -> {10, 'X'}
            seq == 'I' && (sum == 1 || sum > 10) -> {8, ''}
            seq == 'X' -> {10, 'XX'}
            seq == 'XX' -> {10, ''}
            sum > 10 -> {10, 'X'}
            true -> raise RomanPositionError
        end
    end

    defp eval_char('L', seq, sum) do
        cond do
            seq == '' && (sum == 0 || sum > 50) -> {50, ''}
            seq == 'X' -> {30, ''}
            sum > 50 -> {50, ''}
            true -> raise RomanPositionError
        end
    end

    defp eval_char('C', seq, sum) do
        cond do
            seq == '' && sum == 0 -> {100, 'C'}
            seq == 'X' && (sum == 10 || sum > 100) -> {80, ''}
            seq == 'C' -> {100, 'CC'}
            seq == 'CC' -> {100, ''}
            sum > 100 -> {100, 'C'}
            true -> raise RomanPositionError
        end
    end

    defp eval_char('D', seq, sum) do
        cond do
            seq == '' && (sum == 0 || sum > 500) -> {500, ''}
            seq == 'C' -> {300, ''}
            sum > 500 -> {500, ''}
            true -> raise RomanPositionError
        end
    end

    defp eval_char('M', seq, sum) do
        cond do
            seq == '' && sum == 0 -> {1000, 'M'}
            seq == 'C' && (sum == 100 || sum > 1000) -> {800, ''}
            seq == 'M' -> {1000, 'MM'}
            seq == 'MM' -> {1000, ''}
            sum > 1000 -> {1000, 'M'}
            true -> raise RomanPositionError
        end
    end

    defp eval_char(char, acc) do
        {to_sum, new_seq} = eval_char([char], acc[:seq], acc[:sum])
        
        acc
        |> Keyword.update!(:sum, fn val -> val + to_sum end)
        |> Keyword.update!(:seq, fn _ -> new_seq end)
    end

    defp from_roman(charlist) do
        acc = [
            sum: 0,
            seq: ''
        ]

        Enum.reduce(charlist, acc, &eval_char/2)
        |> Keyword.get(:sum)
    end

    def convert(value) do
        value
        |> to_charlist
        |> from_roman
    end
end

defimpl Converter, for: Integer do
    def convert(value) do
        :integer
    end
end
