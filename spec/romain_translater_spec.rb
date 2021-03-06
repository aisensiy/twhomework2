require 'spec_helper'
require 'roman_translater'

describe RomanTranslater do
  context "single roman number to decimal" do
    it "should convert I to 1" do
      translater = RomanTranslater.new
      expect(translater.roman_to_decimal("I")).to be_eql 1
    end
    it "should convert V to 5" do
      translater = RomanTranslater.new
      expect(translater.roman_to_decimal("V")).to be_eql 5
    end
    it "should convert X to 10" do
      translater = RomanTranslater.new
      expect(translater.roman_to_decimal("X")).to be_eql 10
    end
    it "should convert L to 50" do
      translater = RomanTranslater.new
      expect(translater.roman_to_decimal("L")).to be_eql 50
    end
    it "should convert C to 100" do
      translater = RomanTranslater.new
      expect(translater.roman_to_decimal("C")).to be_eql 100
    end
    it "should convert D to 500" do
      translater = RomanTranslater.new
      expect(translater.roman_to_decimal("D")).to be_eql 500
    end
    it "should convert M to 1000" do
      translater = RomanTranslater.new
      expect(translater.roman_to_decimal("M")).to be_eql 1000
    end
  end

  context "multi roman number to decimal" do
    it "should sum roman number from large to small without substract" do
      translater = RomanTranslater.new
      expect(translater.roman_to_decimal("MMVI")).to be_eql 2006
    end

    it "should sum roman number from large to small with small one before large number" do
      translater = RomanTranslater.new
      expect(translater.roman_to_decimal("MCMXLIV")).to be_eql 1944
    end
  end

  context "invalid roman number detect" do
    it "should return roman" do
      translater = RomanTranslater.new
      expect(translater.decimal_to_roman(1944)).to be_eql "MCMXLIV"
      expect(translater.decimal_to_roman(2006)).to be_eql "MMVI"
    end

    it "should return nil if invalid char is included" do
      translater = RomanTranslater.new
      expect(translater.roman_to_decimal("K")).to be_eql nil
      expect(translater.roman_to_decimal("KK")).to be_eql nil
    end

    it "should return nil if roman is invalid when translate to decimal" do
      translater = RomanTranslater.new
      expect(translater.roman_to_decimal("MMMM")).to be_eql nil
      expect(translater.roman_to_decimal("XD")).to be_eql nil
      expect(translater.roman_to_decimal("DD")).to be_eql nil
      expect(translater.roman_to_decimal("XXMM")).to be_eql nil
    end
  end
end
