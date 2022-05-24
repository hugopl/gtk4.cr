module Gtk
  class TreeSelection
    # Same as `select_path(Gtk::TreePath.new_from_indices({row})`.
    def select_row(row : Int32) : Nil
      tree_path = Gtk::TreePath.new_from_indices({row})
      select_path(tree_path)
    end
  end
end
