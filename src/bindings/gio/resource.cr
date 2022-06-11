module Gio
  # Load the XML *resource_file* and register it, returning the `Gio::Resource`.
  #
  # This macro runs `glib-compile-resources` at compile time, so the XML is only needed at compile time.
  #
  # See `examples/resource.cr` for more info.
  macro register_resource(resource_file)
    {%
      `glib-compile-resources --target crystal-gio-resource.gresource #{resource_file}`
      data = read_file("crystal-gio-resource.gresource")
      `crystal eval 'File.delete("crystal-gio-resource.gresource")'`
    %}
    begin
      resource_data = {{ data }}
      gbytes = LibGLib.g_bytes_new_static(resource_data, resource_data.bytesize)
      error = Pointer(LibGLib::Error).null
      resource = LibGio.g_resource_new_from_data(gbytes, pointerof(error))
      Gio.raise_exception(error) unless error.null?

      Gio::Resource.new(resource, :none).tap do |resource|
        resource._register
      end
    end
  end
end
