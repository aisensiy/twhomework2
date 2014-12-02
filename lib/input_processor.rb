class InputProcessor
  def parse(input)
    [
      parse_intergalactic_map_rules(input),
      parse_metal_unit_rules(input),
      parse_query_rules(input)
    ]
  end

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

  def parse_metal_unit_rules(input)
    pn = /^(?<unit_metal>.+) is (?<num>\d+) Credits$/
    results = []
    input.each do |line|
      match_result = pn.match(line)
      if !match_result.nil?
        results << [match_result[:unit_metal], match_result[:num].to_i]
      end
    end
    results
  end

  def parse_query_rules(input)
    query_pn = /\?$/
    credit_query_pn = /^how many Credits is (?<unit>.+) \?$/
    numeral_query_pn = /^how much is (?<unit>.+) \?$/
    results = []
    input.each do |line|
      if query_pn.match line
        match_result = credit_query_pn.match(line) || numeral_query_pn.match(line)
        if !match_result.nil?
          results << match_result[:unit]
        else
          results << nil
        end
      end
    end
    results
  end
end
