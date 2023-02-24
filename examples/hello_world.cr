require "../src/gtk4"

# This is the simpler hello world version, using signal connections, for an example subclassing
# Gtk::Application see hello_app.cr

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
count = 0

app.activate_signal.connect do
  window = Gtk::ApplicationWindow.new(app)
  window.title = "Hello World!"
  window.set_default_size(200, 200)

  button = Gtk::Button.new_with_label("Hello!!")
  button.clicked_signal.connect do
    count += 1
    button.label = "You clicked #{count} times!"
  end
  window.child = button
  window.present
end

exit(app.run)
