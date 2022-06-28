module Gsk
  class RenderNode
    def initialize(@pointer : Pointer(Void), transfer : GICrystal::Transfer)
      LibGsk.gsk_render_node_ref(@pointer) unless transfer.full?
    end
  end
end
