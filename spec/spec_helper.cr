require "spec"
require "../src/gtk4"

# If any code calls ::abort, this exception will be called instead.
class AbortCalled < RuntimeError
end

# Intercept calls to abort and raise an exception instead, so we can test abort calls
def abort(message)
  raise AbortCalled.new("ABORT: #{message}")
end

private class WarnSupressor
  class_property? supress = false

  def self.supress
    @@supress = true
    yield
  ensure
    @@supress = false
  end
end

private def do_nothing_log_handler(a : Int32, b : Pointer(LibGLib::LogField), c : UInt64, d : Pointer(Void)) : UInt32
  if WarnSupressor.supress?
    GLib::LogWriterOutput::Handled.value
  else
    LibGLib.g_log_writer_default(a, b, c, d)
  end
end

LibGtk.gtk_init
LibGLib.g_log_set_writer_func(->do_nothing_log_handler(Int32, Pointer(LibGLib::LogField), UInt64, Pointer(Void)).pointer, nil, nil)

def supress_warnings
  WarnSupressor.supress do
    yield
  end
end
