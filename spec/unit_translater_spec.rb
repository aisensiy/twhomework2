require 'spec_helper'
require 'unit_translater'

describe UnitTranslater do
  it "should convert metal unit to credit per unit metal" do
    translater = UnitTranslater.new({'glob' => 'I'})
    translater.unit_to_credit("glob glob Silver", 34)
    expect(translater.metal_unit_credit).to be_eql({'Silver' => 17})
  end
end
