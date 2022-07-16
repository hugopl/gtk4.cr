module Gtk
  class Snapshot < Gdk::Snapshot
    # Translates @snapshot's coordinate system by @point in 2-dimensional space.
    def translate(x : Float32, y : Float32) : Nil
      point = LibGraphene::Point.new(x: x, y: y)
      LibGtk.gtk_snapshot_translate(to_unsafe, pointerof(point))
    end

    # Same as `Gtk::Snapshot#append_color`, but receives a bunch of Floats32.
    def append_color(color : Gdk::RGBA, x : Float32, y : Float32, width : Float32, height : Float32) : Nil
      bounds = uninitialized LibGraphene::Rect
      bounds.origin.x = x
      bounds.origin.y = y
      bounds.size.width = width
      bounds.size.height = height
      LibGtk.gtk_snapshot_append_color(to_unsafe, color, pointerof(bounds))
    end

    # Same as `Gtk::Snapshot#push_repeat`, but receives a bunch of Floats32.
    def push_repeat(bounds_x : Float32, bounds_y : Float32, bounds_width : Float32, bounds_height : Float32,
                    child_bounds_x : Float32, child_bounds_y : Float32,
                    child_bounds_width : Float32, child_bounds_height : Float32) : Nil
      bounds = uninitialized LibGraphene::Rect
      bounds.origin.x = bounds_x
      bounds.origin.y = bounds_y
      bounds.size.width = bounds_width
      bounds.size.height = bounds_height
      child_bounds = uninitialized LibGraphene::Rect
      child_bounds.origin.x = child_bounds_x
      child_bounds.origin.y = child_bounds_y
      child_bounds.size.width = child_bounds_width
      child_bounds.size.height = child_bounds_height

      LibGtk.gtk_snapshot_push_repeat(to_unsafe, pointerof(bounds), pointerof(child_bounds))
    end

    # Same as `Gtk::Snapshot#save`, but receives a block and calls `Gtk::Snapshot#restore`
    # automatically
    def save
      LibGtk.gtk_snapshot_save(to_unsafe)
      yield
    ensure
      LibGtk.gtk_snapshot_restore(to_unsafe)
    end
  end
end
