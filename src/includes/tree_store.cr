module Gtk
  class TreeStore
    def insert(parent : TreeIter?, columns : Tuple, values : Tuple, position : Int32) : TreeIter
      iter = insert(parent, position)
      set(iter, columns, values)
      iter
    end
  end
end
