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

    # :ditto:
    def size_allocate(x : Int32, y : Int32, width : Int32, height : Int32, baseline : Int32)
      size_allocate(Gdk::Rectangle.new(x, y, width, height), baseline)
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

    # Note: Manual fixes until a proper solution is merged into the generator.
    def measure(
      orientation : Gtk::Orientation,
      for_size : Int32,
      minimum : Int32* = Pointer(Int32).null,
      natural : Int32* = Pointer(Int32).null,
      minimum_baseline : Int32* = Pointer(Int32).null,
      natural_baseline : Int32* = Pointer(Int32).null,
    ) : Nil
      LibGtk.gtk_widget_measure(to_unsafe, orientation, for_size, minimum, natural, minimum_baseline, natural_baseline)
    end

    private macro _register_measure_vfunc(impl_method_name)
      private def self._vfunc_measure(
        %this : Pointer(Void),
        lib_orientation : UInt32,
        lib_for_size : Int32,
        lib_minimum : Int32*,
        lib_natural : Int32*,
        lib_minimum_baseline : Int32*,
        lib_natural_baseline : Int32*
      ) : Void
        orientation = Gtk::Orientation.new(lib_orientation)
      
        %instance = LibGObject.g_object_get_qdata(%this, GICrystal::INSTANCE_QDATA_KEY)
        raise GICrystal::ObjectCollectedError.new if %instance.null?
      
        %instance.as(self).measure(
          orientation,
          lib_for_size,
          lib_minimum,
          lib_natural,
          lib_minimum_baseline,
          lib_natural_baseline
        )
      end

      def self._class_init(type_struct : Pointer(LibGObject::TypeClass), user_data : Pointer(Void)) : Nil
        vfunc_ptr = (type_struct.as(Pointer(Void)) + 232).as(Pointer(Pointer(Void)))
        vfunc_ptr.value = (->_vfunc_measure(Pointer(Void), UInt32, Int32, Pointer(Int32), Pointer(Int32), Pointer(Int32), Pointer(Int32))).pointer
        previous_def
      end
    end
  end
end
