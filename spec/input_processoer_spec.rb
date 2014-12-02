require 'spec_helper'
require 'input_processor'

describe InputProcessor do
  context "parse intergalactic and roman rule" do
    it "should parse '(word) is (roman)' sentences to {word => roman}" do
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
      processor = InputProcessor.new
      expect(processor.parse_intergalactic_map_rules(input)).to be_eql({'glob' => 'I', 'prok' => 'V', 'pish' => 'X', 'tegj' => 'L'})
    end
  end

  context "parse metal unit rules" do
    it "should parse '(intergalactic unit metal) is (num) Credits' to [intergalactic unit metal, metal]" do
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
      processor = InputProcessor.new
      expect(processor.parse_metal_unit_rules(input)).to be_eql([
        ['glob glob Silver', 34],
        ['glob prok Gold', 57800],
        ['pish pish Iron', 3910]
      ])
    end
  end
end
