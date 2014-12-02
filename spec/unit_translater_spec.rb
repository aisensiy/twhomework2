require 'spec_helper'
require 'unit_translater'

describe UnitTranslater do
  it "should convert metal unit to credit per unit metal" do
    translater = UnitTranslater.new({'glob' => 'I'})
    translater.unit_to_credit("glob glob Silver", 34)
    expect(translater.metal_unit_credit).to be_eql({'Silver' => 17.to_f})
  end

  context "calculate credits of a metal" do
    it "should return Credits if a valid metal is given" do
      translater = UnitTranslater.new({'glob' => 'I', 'prok' => 'V'})
      translater.metal_unit_credit = {'Silver' => 17}
      expect(translater.cal_metal_credit('glob prok Silver')).to be_eql "68 Credits"
    end

    it "should return nil if a invalid metal is given" do
      translater = UnitTranslater.new({'glob' => 'I', 'prok' => 'V'})
      translater.metal_unit_credit = {'Silver' => 17}
      expect(translater.cal_metal_credit('prok prok Silver')).to be_nil
      expect(translater.cal_metal_credit('prok prak Silver')).to be_nil
    end

    it "should return a deciaml if a valid intergalactic numeral is given" do
      translater = UnitTranslater.new({'glob' => 'I', 'prok' => 'V'})
      translater.metal_unit_credit = {'Silver' => 17}
      expect(translater.cal_metal_credit('glob prok')).to be_eql 4
    end

    it "should return nil if a invalid intergalactic numeral is given" do
      translater = UnitTranslater.new({'glob' => 'I', 'prok' => 'V'})
      translater.metal_unit_credit = {'Silver' => 17}
      expect(translater.cal_metal_credit('prok prok')).to be_nil
      expect(translater.cal_metal_credit('prok prak')).to be_nil
    end
  end
end
