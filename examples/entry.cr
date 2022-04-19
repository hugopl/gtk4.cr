require "gtk4"

def activate(app : Gtk::Application)
  window = Gtk::ApplicationWindow.new(app)
  window.title = "Entry"

  box = Gtk::Box.new(:vertical, 0)
  label = Gtk::Label.new(use_markup: true)
  entry = Gtk::Entry.new

  entry.notify_signal["text"].connect do
    label.text = entry.text
  end

  entry.activate_signal.connect do
    label.markup = "<b>#{label.text}</b>"
    GLib.timeout(1.seconds) do
      label.markup = label.text
      false
    end
  end

  box.prepend(label)
  box.append(entry)
  window.child = box

  window.present
end

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Gtk::Application))
exit(app.run)
