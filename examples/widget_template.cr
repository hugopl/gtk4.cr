require "../src/gtk4"

# To use widget templates you need:
#
# - include `Gtk::WidgetTemplate` mixin.
# - Annotate your class with `Gtk::UiTemplate`.
#
# The supported template parameters are:
#
# file: Absolute path to the UI file, i.e. the XML.
# resource: Path to resource file, see `widget_template_using_resource.cr` for an example
# children: Array with list of widget ids inside the XML that you want to access from Crystal code.
@[Gtk::UiTemplate(file: "#{__DIR__}/widget_template.ui", children: %w(label))]
class ExampleAppWindow < Gtk::ApplicationWindow
  include Gtk::WidgetTemplate

  @label : Gtk::Label

  def initialize
    # The parent constructor must be called to set things up.
    super()

    # To access the internal template widgets declared in the `Gtk::UiTemplate` annotation you must
    # call `template_child` method and cast it to the proper type.
    @label = Gtk::Label.cast(template_child("label"))
    @label.text = "Hey! I was a Gtk::Label in the UI file and now in Crystal land!"
  end
end

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect do
  window = ExampleAppWindow.new
  window.application = app
  window.present
end

exit(app.run)
