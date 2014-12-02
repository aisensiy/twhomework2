class InputProcessor
  def parse_intergalactic_map_rules(input)
    pn = /^(?<intergalactic>\w+) is (?<roman>\w+)$/
    rules = {}
    input.each do |line|
      match_result = pn.match(line)
      if !match_result.nil?
        rules[match_result[:intergalactic]] = match_result[:roman]
      end
    end
    rules
  end
end
