module Gtk
  class Stack < Widget
    # Returns true if this `Stack` has some children with *name*.
    def has_child?(name : String) : Bool
      !LibGtk.gtk_stack_get_child_by_name(self, name).null?
    end

    # Returns true if *child* is a child of this `Stack`.
    def has_child?(child : Gtk::Widget) : Bool
      !LibGtk.gtk_stack_get_page(@pointer, child).null?
    end
  end
end
