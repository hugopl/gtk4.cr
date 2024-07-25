lib LibGdk
  fun gdk_clipboard_set_text(clipboard : Void*, text : LibC::Char*)
end

module Gdk
  class Clipboard
    # Puts the given text into the clipboard.
    def text=(text : String) : Nil
      LibGdk.gdk_clipboard_set_text(to_unsafe, text)
    end
  end
end
