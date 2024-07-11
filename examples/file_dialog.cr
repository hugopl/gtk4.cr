require "../src/gtk4"

def activate(app : Gtk::Application)
  dialog = Gtk::FileDialog.new
  dialog.open(nil, nil) do |obj, result|
    file = dialog.open_finish(result)
    puts "You choose: #{file.path}" if file
  rescue e
    STDERR.puts("#{e.class.name} raised: #{e.message}")
  ensure
    app.quit
  end
  app.hold # Since there's no windows open, we must tell the application to not quit
end

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Gtk::Application))
exit(app.run)
