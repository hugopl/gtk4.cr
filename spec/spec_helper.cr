require "spec"
require "../src/gtk4"

LibGtk.gtk_init

# If any code calls ::abort, this exception will be called instead.
class AbortCalled < RuntimeError
end

# Intercept calls to abort and raise an exception instead, so we can test abort calls
def abort(message)
  raise AbortCalled.new("ABORT: #{message}")
end
