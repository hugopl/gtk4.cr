require "./spec_helper"

describe "Gtk/Gsk/etc fundamental types" do
  it "can be instatiated" do
    supress_warnings do
      Gdk::Event.new(Pointer(Void).null, :none)
      Gsk::RenderNode.new(Pointer(Void).null, :none)
      Gtk::Expression.new(Pointer(Void).null, :none)
    end
  end
end
