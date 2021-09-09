require "../src/gtk4"

UI = <<-EOT
<?xml version="1.0" encoding="UTF-8"?>
<interface>
  <requires lib="gtk" version="4.0"/>
  <object class="GtkBox" id="root">
    <property name="can-focus">0</property>
    <property name="orientation">vertical</property>
    <child>
      <object class="GtkLabel">
        <property name="can-focus">0</property>
        <property name="label" translatable="yes">Hope someone add GTK4
support to glade soon</property>
        <property name="justify">right</property>
      </object>
    </child>
  </object>
</interface>
EOT

def activate(app : Gtk::Application)
  window = Gtk::ApplicationWindow.new(app)
  window.title = "Gtk Builder"
  window.set_default_size(200, 200)

  builder = Gtk::Builder.new_from_string(UI, UI.bytesize.to_i64)
  root = Gtk::Widget.cast(builder["root"])

  window.child = root
  window.present
end

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Gtk::Application))
exit(app.run(ARGV))
