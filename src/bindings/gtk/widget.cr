module Gtk
  private struct WidgetChildrenIterator
    include Iterator(Widget)

    def initialize(widget : Widget)
      @child = widget.first_child
    end

    def next
      child = @child
      if child.nil?
        stop
      else
        @child = child.next_sibling
        child
      end
    end
  end

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

    # Returns an `Iterator` over widget children. Call `.to_a` on it if you need to allocate an
    # array with all children.
    #
    # ```
    # widget.children.with_index do |child, i|
    #   puts "Hi, I'm child #{i}, #{child}"
    # end
    # ```
    def children : Iterator(Widget)
      WidgetChildrenIterator.new(self)
    end
  end
end
