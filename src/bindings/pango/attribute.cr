module Pango
  class Attribute
    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = if transfer.none?
                   LibPango.pango_attribute_copy(pointer)
                 else
                   pointer
                 end
    end

    def finalize
      {% if flag?(:debugmemory) %}
        LibC.printf("~%s at %p\n", self.class.name.to_unsafe, self)
      {% end %}
      LibPango.pango_attribute_destroy(to_unsafe)
    end
  end
end
