require "../src/gtk4"

def activate(app : Gtk::Application)
  window = Gtk::ApplicationWindow.new(app)
  window.title = "TreeView"
  window.set_default_size(200, 200)

  builder = Gtk::Builder.new_from_file("#{__DIR__}/tree_view.ui")
  model = Gtk::TreeStore.cast(builder["tree_model"])
  label = Gtk::Label.cast(builder["label"])
  fill_model(model)

  view = Gtk::TreeView.cast(builder["tree_view"])
  view.row_activated_signal.connect do |path, column|
    iter = model.iter(path)

    value = model.value(iter, 0)
    label.text = "You Clicked on #{value.as_s}"
  end

  window.child = Gtk::Widget.cast(builder["root"])
  window.present
end

def fill_model(model)
  root = model.append(nil)
  model.set(root, {0}, {"Root"})
#
  child = model.append(root)
  model.set(child, {0}, {"Child!"})
end

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
app.activate_signal.connect(->activate(Gtk::Application))
exit(app.run(ARGV))


