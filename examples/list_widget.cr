require "../src/gtk4"

class ModelItem < GObject::Object
  @[GObject::Property]
  property text : String

  def initialize(@text)
    super()
  end
end

class Model < GObject::Object
  include Gio::ListModel

  @data = [] of ModelItem

  def add_item(text : String)
    @data << ModelItem.new(text)
    items_changed(position: @data.size - 1, removed: 0, added: 1)
  end

  @[GObject::Virtual]
  def get_n_items : UInt32
    @data.size.to_u32
  end

  @[GObject::Virtual]
  def get_item(pos : UInt32) : GObject::Object?
    @data[pos]?
  end

  @[GObject::Virtual]
  def get_item_type : UInt64
    ModelItem.g_type
  end
end

app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)

def setup_item(obj : GObject::Object) : Nil
  list_item = Gtk::ListItem.cast(obj)
  list_item.child = Gtk::Label.new
end

def bind_item(obj : GObject::Object)
  list_item = Gtk::ListItem.cast(obj)
  list_item.child.as(Gtk::Label).label = list_item.item.as(ModelItem).text
end

app.activate_signal.connect do
  window = Gtk::ApplicationWindow.new(application: app, title: "List")
  window.set_default_size(200, 200)

  list = Gtk::ListView.new
  model = Model.new
  list.model = Gtk::SingleSelection.new(model)

  factory = Gtk::SignalListItemFactory.new
  factory.setup_signal.connect(->setup_item(GObject::Object))
  factory.bind_signal.connect(->bind_item(GObject::Object))
  list.factory = factory

  button = Gtk::Button.new(label: "Add Item")
  button.clicked_signal.connect do
    model.add_item("Some item")
  end

  box = Gtk::Box.new(:vertical, 6)
  box.append(list)
  box.append(button)

  window.child = box
  window.present
end

exit(app.run)
