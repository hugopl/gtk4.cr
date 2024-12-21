module Gtk
  # This annotation tells GTK how to load UI files and what widgets should expose to the class,
  # see `WidgetTemplate` for more information.
  annotation UiTemplate
  end

  # Module used to implement widgets using XML templates.
  #
  # The example below creates a window with the widgets defined by the
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
  #
  # You can also load the UI file from a resource by using `resource` instead of `file` on `Gtk::UiTemplate` parameter.
  module WidgetTemplate
    macro included
      def self._class_init(klass : Pointer(LibGObject::TypeClass), user_data : Pointer(Void)) : Nil
        previous_def

        {% unless @type.annotation(Gtk::UiTemplate) %}
        {% raise "You must annotate #{@type} with Gtk::UiTemplate." %}
        {% end %}

        {% ui = @type.annotation(Gtk::UiTemplate) %}

        {% if ui[:file] %}
          {% if flag?(:release) %}
          data = {{ read_file(ui[:file]) }}
          {% else %}
          data = File.read({{ ui[:file] }})
          {% end %}
          gbytes = LibGLib.g_bytes_new_static(data, data.bytesize)
          LibGtk.gtk_widget_class_set_template(klass, gbytes)
        {% elsif ui[:resource] %}
          LibGtk.gtk_widget_class_set_template_from_resource(klass, {{ ui[:resource] }})
        {% end %}

        {% if ui[:children] %}
          {% for child in ui[:children] %}
            LibGtk.gtk_widget_class_bind_template_child_full(klass, {{ child }}, 0, 0_i64)
          {% end %}
        {% end %}

        {% if ui[:ensure_classes] %}
          {% for child in ui[:ensure_classes] %}
            LibGObject.g_type_ensure({{ child }}.g_type)
          {% end %}
        {% end %}
      end

      def self._instance_init(instance : Pointer(LibGObject::TypeInstance), type : Pointer(LibGObject::TypeClass)) : Nil
        previous_def
        LibGtk.gtk_widget_init_template(instance)
      end
    end
  end
end
