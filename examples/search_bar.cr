# Code ported from https://gitlab.gnome.org/GNOME/gtk/-/blob/main/examples/search-bar.c
require "../src/gtk4"

class Application < Gtk::Application
  @click_count = 0

  def initialize
    super(application_id: "org.gtk.Example.GtkSearchBar", flags: Gio::ApplicationFlags::None)
  end

  @[GObject::Virtual]
  def activate
    window = Gtk::ApplicationWindow.new(self)
    window.present
    window.title = "SearchBar"

    search_bar = Gtk::SearchBar.new
    search_bar.valign = :start
    window.child = search_bar

    box = Gtk::Box.new(:horizontal, 6)
    search_bar.child = box

    entry = Gtk::SearchEntry.new
    entry.hexpand = true
    box.append(entry)

    menu_button = Gtk::MenuButton.new
    box.append(menu_button)

    search_bar.connect_entry(entry)
    search_bar.key_capture_widget = window
  end
end

exit(Application.new.run)
