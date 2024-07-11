require "../src/gtk4"

def activate(app : Gtk::Application)
  options = {"Yes", "Maybe"}
  alert_dialog = Gtk::AlertDialog.new(message: "Message", buttons: options)
  alert_dialog.choose(nil, nil) do |obj, result|
    idx = alert_dialog.choose_finish(result)
    puts "You choose: #{options[idx]}"
  ensure
    app.quit
  end
  app.hold
end

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Gtk::Application))
exit(app.run)
