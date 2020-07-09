defmodule ConverterTest do
    use ExUnit.Case
    doctest Converter

    def roman_position_error() do
        %RomanPositionError{
            message: "invalid order in the Roman number"
        }
    end

    describe "convert/1 for String" do

        test "should return equivalent values for combinations of I" do
            assert Converter.convert("I") == 1
            assert Converter.convert("II") == 2
            assert Converter.convert("III") == 3
        end

        test "should throw an exception in case of a invalid combinations of I" do
            assert catch_error(Converter.convert("IVIII")) == roman_position_error()
        end

        test "should return equivalent values for combinations of V Roman number" do
            assert Converter.convert("V") == 5
            assert Converter.convert("IV") == 4
            assert Converter.convert("VIII") == 8
        end

        test "should throw an exception in case of a invalid combinations of V" do
            assert catch_error(Converter.convert("IIV")) == roman_position_error()
            assert catch_error(Converter.convert("IIIV")) == roman_position_error()
            assert catch_error(Converter.convert("VV")) == roman_position_error()
        end

        test "should return equivalent values for combinations of X Roman number" do
            assert Converter.convert("IX") == 9
            assert Converter.convert("X") == 10
            assert Converter.convert("XI") == 11
            assert Converter.convert("XII") == 12
            assert Converter.convert("XIII") == 13
            assert Converter.convert("XIV") == 14
            assert Converter.convert("XV") == 15
            assert Converter.convert("XX") == 20
            assert Converter.convert("XXX") == 30
            assert Converter.convert("XXXI") == 31
            assert Converter.convert("XXXII") == 32
            assert Converter.convert("XXXIII") == 33
            assert Converter.convert("XXXIV") == 34
            assert Converter.convert("XXXV") == 35
        end

        test "should throw an exception in case of a invalid combinations of X" do
            assert catch_error(Converter.convert("IIX")) == roman_position_error()
            assert catch_error(Converter.convert("VX")) == roman_position_error()
            assert catch_error(Converter.convert("VIX")) == roman_position_error()
        end

        test "should return equivalent values for combinations of L Roman number" do
            assert Converter.convert("L") == 50
            assert Converter.convert("XL") == 40
            assert Converter.convert("LX") == 60
            assert Converter.convert("LXX") == 70
            assert Converter.convert("LXXX") == 80
        end

        test "should throw an exception in case of a invalid combinations of L" do
            assert catch_error(Converter.convert("IIL")) == roman_position_error()
            assert catch_error(Converter.convert("XXXL")) == roman_position_error()
            assert catch_error(Converter.convert("LL")) == roman_position_error()
        end

        test "should return equivalent values for combinations of C Roman number" do
            assert Converter.convert("XC") == 90
            assert Converter.convert("C") == 100
            assert Converter.convert("CX") == 110
            assert Converter.convert("CXX") == 120
            assert Converter.convert("CXXX") == 130
            assert Converter.convert("CXL") == 140
            assert Converter.convert("CL") == 150
            assert Converter.convert("CC") == 200
            assert Converter.convert("CCC") == 300
            assert Converter.convert("CCCI") == 301
            assert Converter.convert("CCCX") == 310
            assert Converter.convert("CCCXX") == 320
            assert Converter.convert("CCCXXX") == 330
            assert Converter.convert("CCCXL") == 340
            assert Converter.convert("CCCL") == 350
        end

        test "should throw an exception in case of a invalid combinations of C" do
            assert catch_error(Converter.convert("IC")) == roman_position_error()
            assert catch_error(Converter.convert("VC")) == roman_position_error()
            assert catch_error(Converter.convert("IXC")) == roman_position_error()
            assert catch_error(Converter.convert("XXC")) == roman_position_error()
            assert catch_error(Converter.convert("LC")) == roman_position_error()
            assert catch_error(Converter.convert("LXC")) == roman_position_error()
        end

        test "should return equivalent values for combinations of D Roman number" do
            assert Converter.convert("D") == 500
            assert Converter.convert("DI") == 501
            assert Converter.convert("DX") == 510
            assert Converter.convert("CD") == 400
            assert Converter.convert("DC") == 600
            assert Converter.convert("DCC") == 700
            assert Converter.convert("DCCC") == 800
        end

        test "should throw an exception in case of a invalid combinations of D" do
            assert catch_error(Converter.convert("ID")) == roman_position_error()
            assert catch_error(Converter.convert("XD")) == roman_position_error()
            assert catch_error(Converter.convert("XCD")) == roman_position_error()
            assert catch_error(Converter.convert("CCCD")) == roman_position_error()
            assert catch_error(Converter.convert("DD")) == roman_position_error()
        end

        test "should return equivalent values for combinations of M Roman number" do
            assert Converter.convert("CM") == 900
            assert Converter.convert("M") == 1000
            assert Converter.convert("MC") == 1100
            assert Converter.convert("MCC") == 1200
            assert Converter.convert("MCCC") == 1300
            assert Converter.convert("MCD") == 1400
            assert Converter.convert("MD") == 1500
            assert Converter.convert("MM") == 2000
            assert Converter.convert("MMM") == 3000
            assert Converter.convert("MMMI") == 3001
            assert Converter.convert("MMMX") == 3010
            assert Converter.convert("MMMC") == 3100
            assert Converter.convert("MMMCC") == 3200
            assert Converter.convert("MMMCCC") == 3300
            assert Converter.convert("MMMCD") == 3400
            assert Converter.convert("MMMD") == 3500
        end

        test "should throw an exception in case of a invalid combinations of M" do
            assert catch_error(Converter.convert("IM")) == roman_position_error()
            assert catch_error(Converter.convert("VM")) == roman_position_error()
            assert catch_error(Converter.convert("XM")) == roman_position_error()
            assert catch_error(Converter.convert("LM")) == roman_position_error()
            assert catch_error(Converter.convert("DM")) == roman_position_error()
            assert catch_error(Converter.convert("XCM")) == roman_position_error()
            assert catch_error(Converter.convert("CCM")) == roman_position_error()
            assert catch_error(Converter.convert("DCM")) == roman_position_error()
        end

        test "tests for complex Roman numbers" do
            assert Converter.convert("XIII") == 13
            assert Converter.convert("XIV") == 14
            assert Converter.convert("XVII") == 17
            assert Converter.convert("XIX") == 19
            assert Converter.convert("XXXIII") == 33
            assert Converter.convert("XXXVII") == 37
            assert Converter.convert("XLIII") == 43
            assert Converter.convert("XLIV") == 44
            assert Converter.convert("XLV") == 45
            assert Converter.convert("LVI") == 56
            assert Converter.convert("LXXVI") == 76
            assert Converter.convert("LXXXVIII") == 88
            assert Converter.convert("XCIV") == 94
            assert Converter.convert("XCIX") == 99
            assert Converter.convert("CLXXXVIII") == 188
            assert Converter.convert("CCXXII") == 222
            assert Converter.convert("CCCXXXIII") == 333
            assert Converter.convert("CCCLXXXVIII") == 388
            assert Converter.convert("CDXLIV") == 444
            assert Converter.convert("DLV") == 555
            assert Converter.convert("DCCLXXVII") == 777
            assert Converter.convert("DCCCLXXXVIII") == 888
            assert Converter.convert("CMXCIX") == 999
            assert Converter.convert("MCCCXXXVIII") == 1338
            assert Converter.convert("MMCCCXLV") == 2345
            assert Converter.convert("MMDCLXVI") == 2666
            assert Converter.convert("MMDCCCLXXXVIII") == 2888
            assert Converter.convert("MMCMLXXXVII") == 2987
            assert Converter.convert("MMCMXCIX") == 2999
        end
    end
end
