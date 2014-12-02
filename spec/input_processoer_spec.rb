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

  context "parse query" do
    it "should parse 'how much is (intergalactic unit) ?' to intergalactic unit" do
      input = [
        'glob is I',
        'prok is V',
        'pish is X',
        'tegj is L',
        'glob glob Silver is 34 Credits',
        'glob prok Gold is 57800 Credits',
        'pish pish Iron is 3910 Credits',
        'how much is pish tegj glob glob ?'
      ]
      processor = InputProcessor.new
      expect(processor.parse_query_rules(input)).to be_eql([
        'pish tegj glob glob'
      ])
    end

    it "should parse 'how many Credits is (intergalactic unit metal) ?' to intergalactic unit metal" do
      input = [
        'glob is I',
        'prok is V',
        'pish is X',
        'tegj is L',
        'glob glob Silver is 34 Credits',
        'glob prok Gold is 57800 Credits',
        'pish pish Iron is 3910 Credits',
        'how many Credits is glob prok Silver ?',
        'how many Credits is glob prok Gold ?',
        'how many Credits is glob prok Iron ?'
      ]
      processor = InputProcessor.new
      expect(processor.parse_query_rules(input)).to be_eql([
        'glob prok Silver',
        'glob prok Gold',
        'glob prok Iron'
      ])
    end

    it "should parse invalid query and return nil" do
      input = ['how much wood could a woodchuck chuck if a woodchuck could chuck wood ?']
      processor = InputProcessor.new
      expect(processor.parse_query_rules(input)).to be_eql([nil])
    end
  end

  it "should parse all" do
    input = [
      'glob is I',
      'prok is V',
      'pish is X',
      'tegj is L',
      'glob glob Silver is 34 Credits',
      'glob prok Gold is 57800 Credits',
      'pish pish Iron is 3910 Credits',
      'how many Credits is glob prok Silver ?',
      'how many Credits is glob prok Gold ?',
      'how many Credits is glob prok Iron ?'
    ]
    processor = InputProcessor.new
    expect(processor.parse(input)).to be_eql([
      {'glob' => 'I', 'prok' => 'V', 'pish' => 'X', 'tegj' => 'L'},
      [
        ['glob glob Silver', 34],
        ['glob prok Gold', 57800],
        ['pish pish Iron', 3910]
      ],
      ['glob prok Silver', 'glob prok Gold', 'glob prok Iron']
    ])
  end
end
