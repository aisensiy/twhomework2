require 'spec_helper'
require 'unit_translater'

describe UnitTranslater do
  it "should convert metal unit to credit per unit metal" do
    translater = UnitTranslater.new({'glob' => 'I'})
    expect(translater.unit_to_credit("glob glob Silver", 34)).to be_eql ["Silver", 17]
  end
end
