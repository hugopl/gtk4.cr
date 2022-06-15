require "gtk4"
require "colorize"

# Load and register the resources defined in resource.xml
#
# Usually we don't need the `Gio::Resource` in the return value, but it's used in the example to
# see that it really works 😎️
resource = Gio.register_resource("resource.xml")
resource_bytes = resource.lookup_data("/example/resource.cr")

puts "Bellow is this own source code, blunded at compile time into a GResource".colorize.green
puts "------------------------------------------------------------------------".colorize.green
puts String.new(resource_bytes.data).colorize.dark_gray
