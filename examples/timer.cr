require "../src/gtk4"

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)

def activate(app : Gtk::Application)
  window = Gtk::ApplicationWindow.new(app)
  window.title = "Timer"
  window.set_default_size(200, 200)

  label = Gtk::Label.new("0")
  GLib.timeout(1.second) do
    label.text = Time.local.to_s
    true
  end

  GLib.idle_add do
    label.text = "I was idle..."
    false
  end
  window.child = label
  window.present
end

app.activate_signal.connect(->activate(Gtk::Application))
exit(app.run(ARGV))
