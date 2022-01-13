module Gtk
  class ListStore
    def append(columns : Enumerable(Int32), values : Enumerable) : TreeIter
      iter = append
      set(iter, columns, values)
      iter
    end

    def set(row : Int32, columns : Enumerable(Int32), values : Enumerable) : TreeIter
      tree_path = Gtk::TreePath.new_from_indices({row})
      iter = iter(tree_path)
      set(iter, columns, values)
      iter
    end
  end
end
