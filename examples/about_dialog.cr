require "../src/gtk4"

def activate(app : Gtk::Application)
  Gtk.show_about_dialog(nil, name: "AboutDialog Example",
    application: app,
    program_name: "About Dialog With ♥️",
    version: "1.0.0",
    logo_icon_name: "emote-love-symbolic",
    website: "https://github.com/hugopl/gtk4.cr",
    website_label: "Crystal Gtk-4 Bindings",
    authors: ["Hugo Parente Lima"],
    license_type: Gtk::License::MitX11)
end

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Gtk::Application))
exit(app.run(ARGV))
