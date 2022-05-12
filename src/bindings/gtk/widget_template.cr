lib LibGLib
  fun g_bytes_new_static(data : Void*, size : LibC::SizeT) : Void*
end

module Gtk
  annotation UiTemplate
  end

  # Module used to implement widgets using XML templates.
  #
  # The example bellow creates a window with the widgets defined by the
  # XML file _widget_template.ui_
  #
  # ```Crystal
  # @[Gtk::UiTemplate(file: "#{__DIR__}/widget_template.ui")]
  # class ExampleAppWindow < Gtk::ApplicationWindow
  #   include Gtk::WidgetTemplate
  # end
  #
  # app = Gtk::Application.new("hello.example.com", Gio::ApplicationFlags::None)
  # app.activate_signal.connect do
  #   window = ExampleAppWindow.new
  #   window.application = app
  #   window.present
  # end
  #
  # exit(app.run)
  # ```
  module WidgetTemplate
    macro included
      def self._class_init(klass : Pointer(LibGObject::TypeClass), user_data : Pointer(Void)) : Nil
        previous_def

        {% unless @type.annotation(Gtk::UiTemplate) %}
        {% raise "You must annotate #{@type} with Gtk::UiTemplate." %}
        {% end %}
        {% if flag?(:release) %}
        data = {{ read_file(@type.annotation(Gtk::UiTemplate)[:file]) }}
        {% else %}
        data = File.read({{ @type.annotation(Gtk::UiTemplate)[:file] }})
        {% end %}
        gbytes = LibGLib.g_bytes_new_static(data, data.bytesize)
        LibGtk.gtk_widget_class_set_template(klass, gbytes)

        {% for child in @type.annotation(Gtk::UiTemplate)[:children] %}
          LibGtk.gtk_widget_class_bind_template_child_full(klass, {{ child }}, 0, 0_i64)
        {% end %}
      end

      def self._instance_init(instance : Pointer(LibGObject::TypeInstance), type : Pointer(LibGObject::TypeClass)) : Nil
        LibGtk.gtk_widget_init_template(instance)
        previous_def
      end
    end
  end
end
