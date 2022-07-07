module Gtk
  class Snapshot < Gdk::Snapshot
    # Translates @snapshot's coordinate system by @point in 2-dimensional space.
    def translate(x : Float32, y : Float32) : Nil
      point = LibGraphene::Point.new(x: x, y: y)
      LibGtk.gtk_snapshot_translate(to_unsafe, pointerof(point))
    end

    def append_color(color : Gdk::RGBA, x : Float32, y : Float32, width : Float32, height : Float32) : Nil
      bounds = uninitialized LibGraphene::Rect
      bounds.origin.x = x
      bounds.origin.y = y
      bounds.size.width = width
      bounds.size.height = height
      LibGtk.gtk_snapshot_append_color(to_unsafe, color, pointerof(bounds))
    end
  end
end
