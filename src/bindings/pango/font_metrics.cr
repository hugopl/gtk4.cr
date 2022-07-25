module Pango
  class FontMetrics
    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = pointer
      LibPango.pango_font_metrics_ref(to_unsafe) if transfer.none?
    end

    def finalize
      {% if flag?(:debugmemory) %}
        LibC.printf("~%s at %p - ref count: %d\n", self.class.name.to_unsafe, self, ref_count)
      {% end %}
      LibPango.pango_font_metrics_unref(to_unsafe)
    end
  end
end
