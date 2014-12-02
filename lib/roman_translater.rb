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
      roman.scan(/IV|IX|XL|XC|CD|CM|\w/).map do |ch|
        @@map[ch]
      end.reduce(&:+)
    end
  end
end
