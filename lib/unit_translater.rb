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
    @metal_unit_credit[metal] = 1.0 * credit / @roman_translater.roman_to_decimal(roman)
  end

  def cal_metal_credit(metal)
    return if metal.nil?
    words = metal.scan(/\w+/)
    if metal_unit_credit.keys.include? words[-1]
      roman = words[0...-1].map do |v|
        return if !@map.include?(v)
        @map[v]
      end.join()
      decimal = @roman_translater.roman_to_decimal(roman)
      return nil if decimal.nil?
      credits = metal_unit_credit[words[-1]] * decimal
      "#{credits.to_i} Credits"
    else
      roman = words.map do |v|
        return if !@map.include?(v)
        @map[v]
      end.join()
      @roman_translater.roman_to_decimal(roman)
    end
  end
end
