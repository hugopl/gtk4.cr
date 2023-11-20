# This is here because GTK 4.7 changed this signal signature, so this code bellow is a copy to
# what would be generated with recent GTK4 versions, so examples/list_widget.cr compiles on CI
module Gtk
  {% if MINOR_VERSION < 7 %}
    struct Gtk::SignalListItemFactory::SetupSignal
      def connect(handler : Proc(GObject::Object, Nil), *, after : Bool = false) : GObject::SignalConnection
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_object : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          object = GObject::Object.new(lib_object, GICrystal::Transfer::None)
          ::Box(Proc(GObject::Object, Nil)).unbox(_lib_box).call(object)
        }.pointer

        handler_id = LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, after.to_unsafe)
        GObject::SignalConnection.new(@source, handler_id)
      end
    end
  {% end %}
end
