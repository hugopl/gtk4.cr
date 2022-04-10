require "./spec_helper"

describe Gdk::ModifierType do
  it "can be generated from value with internal data" do
    flag = Gdk::ModifierType.new(16)
    flag.none?.should eq(true)
  end
end
