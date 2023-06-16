module Gdk
  class Display < GObject::Object
    # Same as `GdkDisplay.default.not_nil!`.
    def self.default! : Gdk::Display
      default.not_nil!
    end
  end
end
