require "./spec_helper"

describe Gdk::Display do
  it "implements .default!" do
    Gdk::Display.responds_to?(:default!).should eq(true)
  end
end
