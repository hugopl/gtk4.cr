require "./spec_helper"

describe Gtk::Stack do
  it "responds to has_child?(String)" do
    child = Gtk::Label.new
    stack = Gtk::Stack.new
    stack.has_child?("test").should eq(false)
    stack.add_named(child, "test")
    stack.has_child?("test").should eq(true)
  end

  it "responds to has_child?(Widget)" do
    child = Gtk::Label.new
    stack = Gtk::Stack.new
    stack.has_child?(child).should eq(false)
    stack.add_child(child)
    stack.visible_child = child
    stack.has_child?(child).should eq(true)
  end
end
