module Gtk
  class Widget < GObject::InitiallyUnowned
    # Convenient function, same as `template_child(self.class.g_type, name)`.
    def template_child(name : String) : GObject::Object
      template_child(self.class.g_type, name)
    end

    def template_child(widget_type : UInt64, name : ::String) : GObject::Object
      ptr = LibGtk.gtk_widget_get_template_child(@pointer, widget_type, name)

      abort("XML element with id: '#{name}' not found for #{self.class} template.") if ptr.null?
      GObject::Object.new(ptr, GICrystal::Transfer::None)
    end
  end
end
