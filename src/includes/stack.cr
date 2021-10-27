module Gtk
  class Stack < Widget
    # Returns true if this Stack has some children.
    def has_child?(name : String) : Bool
      !LibGtk.gtk_stack_get_child_by_name(self, name).null?
    end
  end
end
