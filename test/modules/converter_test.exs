defmodule ConverterTest do
    use ExUnit.Case
    import Converter
    doctest Converter

    def roman_position_error() do
        %RomanPositionError{
            message: "invalid order in the Roman number"
        }
    end

    describe "tests for Helper" do
        
        test "should return the equivalent number of repeated chars" do
            assert Converter.Helper.repeat('a', 0) == nil
            assert Converter.Helper.repeat('a', 1) == 'a'
            assert Converter.Helper.repeat('a', 2) == 'aa'
            assert Converter.Helper.repeat('a', 3) == 'aaa'
            assert Converter.Helper.repeat('a', 4) == 'aaaa'
            assert Converter.Helper.repeat('a', 5) == 'aaaaa'
        end
    end

    describe "from_roman/1" do

        test "should return equivalent values for combinations of I" do
            assert from_roman("I") == 1
            assert from_roman("II") == 2
            assert from_roman("III") == 3
        end

        test "should throw an exception in case of a invalid combinations of I" do
            assert catch_error(Converter.from_roman("IVIII")) == roman_position_error()
        end

        test "should return equivalent values for combinations of V Roman number" do
            assert Converter.from_roman("V") == 5
            assert Converter.from_roman("IV") == 4
            assert Converter.from_roman("VIII") == 8
        end

        test "should throw an exception in case of a invalid combinations of V" do
            assert catch_error(Converter.from_roman("IIV")) == roman_position_error()
            assert catch_error(Converter.from_roman("IIIV")) == roman_position_error()
            assert catch_error(Converter.from_roman("VV")) == roman_position_error()
        end

        test "should return equivalent values for combinations of X Roman number" do
            assert Converter.from_roman("IX") == 9
            assert Converter.from_roman("X") == 10
            assert Converter.from_roman("XI") == 11
            assert Converter.from_roman("XII") == 12
            assert Converter.from_roman("XIII") == 13
            assert Converter.from_roman("XIV") == 14
            assert Converter.from_roman("XV") == 15
            assert Converter.from_roman("XX") == 20
            assert Converter.from_roman("XXX") == 30
            assert Converter.from_roman("XXXI") == 31
            assert Converter.from_roman("XXXII") == 32
            assert Converter.from_roman("XXXIII") == 33
            assert Converter.from_roman("XXXIV") == 34
            assert Converter.from_roman("XXXV") == 35
        end

        test "should throw an exception in case of a invalid combinations of X" do
            assert catch_error(Converter.from_roman("IIX")) == roman_position_error()
            assert catch_error(Converter.from_roman("VX")) == roman_position_error()
            assert catch_error(Converter.from_roman("VIX")) == roman_position_error()
        end

        test "should return equivalent values for combinations of L Roman number" do
            assert Converter.from_roman("L") == 50
            assert Converter.from_roman("XL") == 40
            assert Converter.from_roman("LX") == 60
            assert Converter.from_roman("LXX") == 70
            assert Converter.from_roman("LXXX") == 80
        end

        test "should throw an exception in case of a invalid combinations of L" do
            assert catch_error(Converter.from_roman("IIL")) == roman_position_error()
            assert catch_error(Converter.from_roman("XXXL")) == roman_position_error()
            assert catch_error(Converter.from_roman("LL")) == roman_position_error()
        end

        test "should return equivalent values for combinations of C Roman number" do
            assert Converter.from_roman("XC") == 90
            assert Converter.from_roman("C") == 100
            assert Converter.from_roman("CX") == 110
            assert Converter.from_roman("CXX") == 120
            assert Converter.from_roman("CXXX") == 130
            assert Converter.from_roman("CXL") == 140
            assert Converter.from_roman("CL") == 150
            assert Converter.from_roman("CC") == 200
            assert Converter.from_roman("CCC") == 300
            assert Converter.from_roman("CCCI") == 301
            assert Converter.from_roman("CCCX") == 310
            assert Converter.from_roman("CCCXX") == 320
            assert Converter.from_roman("CCCXXX") == 330
            assert Converter.from_roman("CCCXL") == 340
            assert Converter.from_roman("CCCL") == 350
        end

        test "should throw an exception in case of a invalid combinations of C" do
            assert catch_error(Converter.from_roman("IC")) == roman_position_error()
            assert catch_error(Converter.from_roman("VC")) == roman_position_error()
            assert catch_error(Converter.from_roman("IXC")) == roman_position_error()
            assert catch_error(Converter.from_roman("XXC")) == roman_position_error()
            assert catch_error(Converter.from_roman("LC")) == roman_position_error()
            assert catch_error(Converter.from_roman("LXC")) == roman_position_error()
        end

        test "should return equivalent values for combinations of D Roman number" do
            assert Converter.from_roman("D") == 500
            assert Converter.from_roman("DI") == 501
            assert Converter.from_roman("DX") == 510
            assert Converter.from_roman("CD") == 400
            assert Converter.from_roman("DC") == 600
            assert Converter.from_roman("DCC") == 700
            assert Converter.from_roman("DCCC") == 800
        end

        test "should throw an exception in case of a invalid combinations of D" do
            assert catch_error(Converter.from_roman("ID")) == roman_position_error()
            assert catch_error(Converter.from_roman("XD")) == roman_position_error()
            assert catch_error(Converter.from_roman("XCD")) == roman_position_error()
            assert catch_error(Converter.from_roman("CCCD")) == roman_position_error()
            assert catch_error(Converter.from_roman("DD")) == roman_position_error()
        end

        test "should return equivalent values for combinations of M Roman number" do
            assert Converter.from_roman("CM") == 900
            assert Converter.from_roman("M") == 1000
            assert Converter.from_roman("MC") == 1100
            assert Converter.from_roman("MCC") == 1200
            assert Converter.from_roman("MCCC") == 1300
            assert Converter.from_roman("MCD") == 1400
            assert Converter.from_roman("MD") == 1500
            assert Converter.from_roman("MM") == 2000
            assert Converter.from_roman("MMM") == 3000
            assert Converter.from_roman("MMMI") == 3001
            assert Converter.from_roman("MMMX") == 3010
            assert Converter.from_roman("MMMC") == 3100
            assert Converter.from_roman("MMMCC") == 3200
            assert Converter.from_roman("MMMCCC") == 3300
            assert Converter.from_roman("MMMCD") == 3400
            assert Converter.from_roman("MMMD") == 3500
        end

        test "should throw an exception in case of a invalid combinations of M" do
            assert catch_error(Converter.from_roman("IM")) == roman_position_error()
            assert catch_error(Converter.from_roman("VM")) == roman_position_error()
            assert catch_error(Converter.from_roman("XM")) == roman_position_error()
            assert catch_error(Converter.from_roman("LM")) == roman_position_error()
            assert catch_error(Converter.from_roman("DM")) == roman_position_error()
            assert catch_error(Converter.from_roman("XCM")) == roman_position_error()
            assert catch_error(Converter.from_roman("CCM")) == roman_position_error()
            assert catch_error(Converter.from_roman("DCM")) == roman_position_error()
        end

        test "tests for complex Roman numbers" do
            assert Converter.from_roman("XIII") == 13
            assert Converter.from_roman("XIV") == 14
            assert Converter.from_roman("XVII") == 17
            assert Converter.from_roman("XIX") == 19
            assert Converter.from_roman("XXXIII") == 33
            assert Converter.from_roman("XXXVII") == 37
            assert Converter.from_roman("XLIII") == 43
            assert Converter.from_roman("XLIV") == 44
            assert Converter.from_roman("XLV") == 45
            assert Converter.from_roman("LVI") == 56
            assert Converter.from_roman("LXXVI") == 76
            assert Converter.from_roman("LXXXVIII") == 88
            assert Converter.from_roman("XCIV") == 94
            assert Converter.from_roman("XCIX") == 99
            assert Converter.from_roman("CLXXXVIII") == 188
            assert Converter.from_roman("CCXXII") == 222
            assert Converter.from_roman("CCCXXXIII") == 333
            assert Converter.from_roman("CCCLXXXVIII") == 388
            assert Converter.from_roman("CDXLIV") == 444
            assert Converter.from_roman("DLV") == 555
            assert Converter.from_roman("DCCLXXVII") == 777
            assert Converter.from_roman("DCCCLXXXVIII") == 888
            assert Converter.from_roman("CMXCIX") == 999
            assert Converter.from_roman("MCCCXXXVIII") == 1338
            assert Converter.from_roman("MMCCCXLV") == 2345
            assert Converter.from_roman("MMDCLXVI") == 2666
            assert Converter.from_roman("MMDCCCLXXXVIII") == 2888
            assert Converter.from_roman("MMCMLXXXVII") == 2987
            assert Converter.from_roman("MMCMXCIX") == 2999
        end
    end

    describe "to_roman/1" do
        
        test "should convert decimal 1 to Roman I" do
            assert to_roman("0") == ""
            assert to_roman("1") == "I"
            assert to_roman("2") == "II"
            assert to_roman("3") == "III"
            assert to_roman("4") == "IV"
            assert to_roman("5") == "V"
            assert to_roman("6") == "VI"
            assert to_roman("7") == "VII"
            assert to_roman("8") == "VIII"
            assert to_roman("9") == "IX"
            assert to_roman("10") == "X"
            assert to_roman("11") == "XI"
            assert to_roman("15") == "XV"
            assert to_roman("20") == "XX"
            assert to_roman("35") == "XXXV"
            assert to_roman("44") == "XLIV"
            assert to_roman("58") == "LVIII"
            assert to_roman("99") == "XCIX"
            assert to_roman("100") == "C"
            assert to_roman("150") == "CL"
            assert to_roman("1000") == "M"
            assert to_roman("2000") == "MM"
            assert to_roman("2888") == "MMDCCCLXXXVIII"
            assert to_roman("3000") == "MMM"
        end
    end
end
