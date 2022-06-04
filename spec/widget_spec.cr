require "./spec_helper"

@[Gtk::UiTemplate(file: "#{__DIR__}/bad_widget.ui", children: %w())]
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
end
