require 'spec_helper'
require 'input_processor'
require 'unit_translater'

describe 'integrate test' do
  it 'should get result as we expect' do
    input = [
      'glob is I',
      'prok is V',
      'pish is X',
      'tegj is L',
      'glob glob Silver is 34 Credits',
      'glob prok Gold is 57800 Credits',
      'pish pish Iron is 3910 Credits',
      'how much is pish tegj glob glob ?',
      'how many Credits is glob prok Silver ?',
      'how many Credits is glob prok Gold ?',
      'how many Credits is glob prok Iron ?',
      'how much wood could a woodchuck chuck if a woodchuck could chuck wood ?'
    ]
    input_proc = InputProcessor.new

    mapping_rules = input_proc.parse_intergalactic_map_rules(input)
    translater = UnitTranslater.new(mapping_rules)
    input_proc.parse_metal_unit_rules(input).each do |rule|
      metal, credits = rule
      translater.unit_to_credit(metal, credits)
    end
    results = []
    input_proc.parse_query_rules(input).each do |query|
      if query.nil?
        results << "I have no idea what you are talking about"
      else
        result = translater.cal_metal_credit(query)
        if result.nil?
          results << "I have no idea what you are talking about"
        else
          results << "#{query} is #{result}"
        end
      end
    end
    expect(results).to be_eql([
      'pish tegj glob glob is 42',
      'glob prok Silver is 68 Credits',
      'glob prok Gold is 57800 Credits',
      'glob prok Iron is 782 Credits',
      'I have no idea what you are talking about'
    ])
  end
end
