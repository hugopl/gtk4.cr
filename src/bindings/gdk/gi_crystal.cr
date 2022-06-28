module GICrystal
  # Finalize *object*.
  def finalize_instance(object : Gdk::Event)
    LibGdk.gdk_event_unref(object)
  end
end
