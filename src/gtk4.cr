require "./gtk-4.0/gtk"

module Gtk
  class Builder
    # Alias to `get_object`.
    def [](name : String)
      get_object(name)
    end
  end
end
