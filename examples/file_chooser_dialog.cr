require "../src/gtk4"

def activate(app : Gtk::Application)
  dialog = Gtk::FileChooserDialog.new(application: app, title: "Choose a file", action: :open)
  dialog.add_button("Cancel", Gtk::ResponseType::Cancel.value)
  dialog.add_button("Open", Gtk::ResponseType::Accept.value)

  dialog.response_signal.connect do |response|
    case Gtk::ResponseType.from_value(response)
    when .cancel? then puts "Cancelled."
    when .accept? then puts "You choose: #{dialog.file.path}"
    end
    dialog.destroy
  end
  dialog.present
end

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Gtk::Application))
exit(app.run(ARGV))
