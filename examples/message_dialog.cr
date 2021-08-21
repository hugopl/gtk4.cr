require "../src/gtk4"

def activate(app : Gtk::Application)
  window = Gtk::ApplicationWindow.new(app)
  window.set_default_size(200, 200)
  window.title = "Message Box"
  label = Gtk::Label.new
  window.child = label

  Gtk::MessageDialog.yes_no(transient_for: window, message_type: :info, title: "Title", text: "😎️") do |response|
    response = Gtk::ResponseType.from_value(response)
    label.text = response.inspect
    next if response.no?

    Gtk::MessageDialog.ok_cancel(transient_for: window, message_type: :info, title: "Title", text: "😁️") do |response|
      response = Gtk::ResponseType.from_value(response)
      label.text = response.inspect
      next if response.cancel?

      Gtk::MessageDialog.ok(transient_for: window, message_type: :info, title: "Title", text: "🤓️") do |response|
        label.text = Gtk::ResponseType.from_value(response).inspect

        Gtk::MessageDialog.close(transient_for: window, message_type: :info, title: "Title", text: "😵‍💫️") do |response|
          label.text = Gtk::ResponseType.from_value(response).inspect

          Gtk::MessageDialog.cancel(transient_for: window, message_type: :info, title: "Title", text: "😅️") do |response|
            label.text = Gtk::ResponseType.from_value(response).inspect
          end
        end
      end
  end
  end

  window.present
end

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Gtk::Application))
exit(app.run(ARGV))
