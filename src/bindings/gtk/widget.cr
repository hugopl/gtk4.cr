module Gtk
  class Widget < GObject::InitiallyUnowned
    # Convenient function, same as `template_child(self.class.g_type, name)`.
    def template_child(name : String) : GObject::Object
      template_child(self.class.g_type, name)
    end
  end
end
