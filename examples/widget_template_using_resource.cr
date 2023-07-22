require "../src/gtk4"

# For more info about how to use Widget Templates see `widget_template.cr` example.
#
# This example shows how to use an UI file from a GResource.
@[Gtk::UiTemplate(resource: "/example/widget_template.ui", children: %w(label))]
class ExampleAppWindow < Gtk::ApplicationWindow
  include Gtk::WidgetTemplate

  @label : Gtk::Label

  def initialize
    # The parent constructor must be called to set things up.
    super()

    # To access the internal template widgets declared in the `Gtk::UiTemplate` annotation you must
    # call `template_child` method and cast it to the proper type.
    @label = Gtk::Label.cast(template_child("label"))
    @label.text = "Hey! I was a Gtk::Label in the UI file inside a GResource and now in Crystal land!"
  end
end

# Most important, we need to load the resource!!
# For more info on this see `resource.cr` example.
resource = Gio.register_resource("./examples/resource.xml", source_dir: "examples")

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect do
  window = ExampleAppWindow.new
  window.application = app
  window.present
end

exit(app.run)
