module Gio
  # Load the XML *resource_file* and register it, returning the `Gio::Resource`.
  #
  # This macro runs `glib-compile-resources` at compile time, so the XML is only needed at compile time.
  #
  # By default the *resource_file* is read from the same directory where the compiler was invoked, to read it from
  # a different directory use the *sourcedir* parameter.
  #
  # See `examples/resource.cr` for more info.
  macro register_resource(resource_file, source_dir = ".")
    {%
      `glib-compile-resources --sourcedir #{source_dir} --target crystal-gio-resource.gresource #{resource_file}`
      data = read_file("crystal-gio-resource.gresource")
      # FIXME: This wont work on windows
      `rm crystal-gio-resource.gresource`
    %}
    begin
      %resource_data = {{ data }}
      %gbytes = LibGLib.g_bytes_new_static(%resource_data, %resource_data.bytesize)
      %error = Pointer(LibGLib::Error).null
      %resource_ptr = LibGio.g_resource_new_from_data(%gbytes, pointerof(%error))
      Gio.raise_gerror(%error) unless %error.null?

      Gio::Resource.new(%resource_ptr, :full).tap do |%resource|
        %resource._register
      end
    end
  end

  class Resource
    # Same as `lookup_data(path, :none)`.
    def lookup_data(path : ::String) : GLib::Bytes
      lookup_data(path, :none)
    end
  end
end
