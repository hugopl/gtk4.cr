module GICrystal
  # Finalize *object*.
  def finalize_instance(object : Gsk::RenderNode)
    LibGsk.gsk_render_node_unref(object)
  end
end
