require "gtk4"

@[Gtk::UiTemplate(file: "#{__DIR__}/widget_template.ui")]
class ExampleAppWindow < Gtk::ApplicationWindow
  include Gtk::WidgetTemplate
end

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect do
  window = ExampleAppWindow.new
  window.application = app
  window.present
end

exit(app.run)
