require "../src/gtk4"

# For a simpler hello example, see hello_world.cr

class HelloApp < Gtk::Application
  @click_count = 0

  def initialize
    super(application_id: "hello.example.com", flags: Gio::ApplicationFlags::None)
  end

  @[GObject::Virtual]
  def activate
    window = Gtk::ApplicationWindow.new(self)
    window.title = "Hello World!"
    window.set_default_size(200, 200)

    button = Gtk::Button.new_with_label("Hello!!")
    button.clicked_signal.connect do
      @click_count += 1
      button.label = "You clicked #{@click_count} times!"
    end
    window.child = button
    window.present
  end
end

exit(HelloApp.new.run)
