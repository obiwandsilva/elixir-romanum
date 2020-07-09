defmodule RomanumTest do
  use ExUnit.Case
  import Romanum
  doctest Romanum

  defmodule RomanumValidatorTest do
    use ExUnit.Case

    import Romanum.Validator

    describe "Romanum.Validator.is_valid_roman/1" do
      test "should return true for a valid Roman number" do
        assert is_valid_roman("XIII") == true
      end

      test "should return false for an input with more than 14 characteres" do
        refute is_valid_roman("XIXIXIXIXIXIXIX")
      end

      test "should return false for an invalid Roman number using decimals" do
        refute is_valid_roman("123")
      end

      test "should return false for an invalid Roman number using invalid letter" do
        refute is_valid_roman("BRXCD")
      end
    
      test "should return true for a valid Roman number even if it is downcase" do
        assert is_valid_roman("mmmdc") == true
      end
    end

    describe "Romanum.Validator.is_valid_decimal/1" do
      test "should return true for a valid decimal number" do
        assert is_valid_decimal("1234") == true
      end

      test "should return false for a number with more than 4 digits" do
        refute is_valid_decimal("12345")
      end

      test "should return true for a decimal number lesser or equal 3000" do
        assert is_valid_decimal("3000") == true
      end

      test "should return false for a decimal number greater than 3000" do
        refute is_valid_decimal("3001")
      end

      test "should return false for value 0" do
        refute is_valid_decimal("0")
      end

      test "should return false for a negative decimal number" do
        refute is_valid_decimal("-1000")
      end
    end
  end

  describe "Romanum.convert/1" do
    test "should return :bitstring for a valid Roman number" do
      assert convert("III") == :bitstring
    end

    test "should return nil for an invalid Roman number" do
      refute convert("IIIA")
    end

    test "should return :integer for a valid decimal number" do
      assert convert("2150") == :integer
    end

    test "should return nil for an invalid decimal number" do
      refute convert("3001")
    end
  end
end
