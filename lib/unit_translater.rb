require 'roman_translater'

class UnitTranslater
  attr_accessor :metal_unit_credit

  def initialize(params)
    @map = params
    @roman_translater = RomanTranslater.new
    @metal_unit_credit = {}
  end

  def unit_to_credit(unit, credit)
    words = unit.scan(/\w+/)
    metal = words[-1]
    roman = words[0...-1].map { |v| @map[v] }.join()
    @metal_unit_credit[metal] = credit / @roman_translater.roman_to_decimal(roman)
  end
end
