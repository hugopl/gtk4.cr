require "./spec_helper"

describe Pango::FontMetrics do
  it "is a heap wrapper" do
    sizeof(Pango::FontMetrics).should eq(sizeof(Pointer(Void)))
  end
end
