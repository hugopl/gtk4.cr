module Pango
  class FontMetrics
    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new("Tried to generate struct with a NULL pointer") if pointer.null?

      @pointer = pointer
      LibPango.pango_font_metrics_ref(to_unsafe) if transfer.none?
    end

    def finalize
      LibPango.pango_font_metrics_unref(to_unsafe)
    end
  end
end
