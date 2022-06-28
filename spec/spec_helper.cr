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

private def do_nothing_log_handler(a : Int32, b : Pointer(Void), c : UInt64, d : Pointer(Void)) : Int32
  1
end

def supress_warnings
  LibGLib.g_log_set_writer_func(->do_nothing_log_handler(Int32, Pointer(Void), UInt64, Pointer(Void)).pointer, nil, nil)
  yield
ensure
  LibGLib.g_log_set_writer_func((->LibGLib.g_log_writer_default).pointer, nil, nil)
end
