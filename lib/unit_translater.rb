require 'roman_translater'

class UnitTranslater
  def initialize(params)
    @map = params
    @roman_translater = RomanTranslater.new
  end

  def unit_to_credit(unit, credit)
    words = unit.scan(/\w+/)
    metal = words[-1]
    roman = words[0...-1].map { |v| @map[v] }.join()
    [metal, credit / @roman_translater.roman_to_decimal(roman)]
  end
end
