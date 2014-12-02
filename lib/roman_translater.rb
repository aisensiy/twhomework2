class RomanTranslater
  @@map = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000,
    "IV" => 4,
    "IX" => 9,
    "XL" => 40,
    "XC" => 90,
    "CD" => 400,
    "CM" => 900
  }

  def roman_to_decimal(roman)
    if roman.size == 1
      @@map[roman]
    else
      result = roman.scan(/IV|IX|XL|XC|CD|CM|\w/).map do |ch|
        return nil if !@@map.keys.include? ch
        @@map[ch]
      end.reduce(&:+)
      if roman != decimal_to_roman(result)
        nil
      else
        result
      end
    end
  end

  def decimal_to_roman(decimal)
    return nil if (decimal> 3999 || decimal < 1)
    num_roman_pair = @@map.map { |k, v| [k, v] }.sort { |a, b| b[1] <=> a[1] }
    result = ""
    num_roman_pair.each do |v|
      roman, num = v
      while decimal >= num
        result += roman
        decimal -= num
      end
    end
    result
  end
end
