require "./spec_helper"

@[Gtk::UiTemplate(file: "#{__DIR__}/bad_widget.ui")]
class BadWidget < Gtk::Widget
  include Gtk::WidgetTemplate

  def initialize
    super()
    template_child("typo")
  end
end

describe Gtk::Widget do
  it "abort when using invalid ids in template widgets" do
    expect_raises(AbortCalled, "XML element with id: 'typo' not found for BadWidget template.") { BadWidget.new }
  end

  it "has #children method" do
    widget = Gtk::Box.new
    widget.children.should be_a(Iterator(Gtk::Widget))
    widget.children.size.should eq(0)

    child1 = Gtk::Label.new
    widget.append(child1)
    child2 = Gtk::Label.new
    widget.append(child2)
    widget.children.to_a.should eq([child1, child2])
  end
end
