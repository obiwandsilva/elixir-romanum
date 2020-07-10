defmodule Converter.Helper do
    defp repeat(_, chars, 0) do
        chars
    end

    defp repeat(char, chars, count) do
        repeat(char, char ++ chars, (count - 1))
    end

    def repeat(_, 0) do
        nil
    end

    def repeat(char, count) do
        repeat(char, [], count)
    end
end

defmodule Converter do

    defmodule FromRoman do
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
    
        def convert(charlist) do
            acc = [
                sum: 0,
                seq: ''
            ]
    
            Enum.reduce(charlist, acc, &eval_char/2)
            |> Keyword.get(:sum)
        end
    end

    defmodule ToRoman do
        import Converter.Helper

        @dictionary %{
            1 => %{
                :unit => 'I',
                :half => 'V',
                :full => 'X'
            },
            2 => %{
                :unit => 'X',
                :half => 'L',
                :full => 'C'
            },
            3 => %{
                :unit => 'C',
                :half => 'D',
                :full => 'M'
            }
        }

        defp get_seq(value, level) do
            %{
                1 => @dictionary[level].unit, 
                2 => repeat(@dictionary[level].unit, 2),
                3 => repeat(@dictionary[level].unit, 3),
                4 => [@dictionary[level].unit, @dictionary[level].half],
                5 => @dictionary[level].half,
                6 => [@dictionary[level].half, @dictionary[level].unit],
                7 => @dictionary[level].half ++ repeat(@dictionary[level].unit, 2),
                8 => @dictionary[level].half ++ repeat(@dictionary[level].unit, 3),
                9 => @dictionary[level].unit ++ @dictionary[level].full,
                0 => ''
            }[value]
        end

        defp eval_char(seq, 0, _) do
            seq
        end

        defp eval_char(_, 4, decimals) do
            [head | tail] = decimals
            
            Converter.Helper.repeat('M', List.to_integer([head]))
            |> eval_char(3, tail)
        end

        defp eval_char(seq, level, decimals) do
            [head | tail] = decimals

            seq ++ get_seq(List.to_integer([head]), level)
            |> eval_char(level - 1, tail)
        end

        def convert(value) do
            size = length(value)

            eval_char('', size, value)
            |> List.to_string
        end
    end

    def from_roman(value) do
        value
        |> to_charlist
        |> FromRoman.convert
    end

    def to_roman(value) do
        value
        |> to_charlist
        |> ToRoman.convert
    end
end
