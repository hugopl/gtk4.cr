module Gtk
  class Builder
    # Alias to `Builder#object`, raises if object can't be found.
    def [](name : String)
      object(name).not_nil!
    end

    # Alias to `Builder#object`.
    def []?(name : String)
      object(name)
    end
  end
end
