module Gtk
  class TreeView
    def set_cursor(row : Int32, start_edit : Bool = false)
      tree_path = Gtk::TreePath.new_from_indices({row})
      set_cursor(tree_path, nil, start_edit)
    end

    def value(path : TreePath, column : Int32) : GObject::Value
      view_model = model.not_nil!
      iter = view_model.iter(path)
      view_model.value(iter, column)
    end
  end
end
