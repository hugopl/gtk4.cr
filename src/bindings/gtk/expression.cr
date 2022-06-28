module Gtk
  class Expression
    def initialize(@pointer : Pointer(Void), transfer : GICrystal::Transfer)
      LibGtk.gtk_expression_ref(@pointer) unless transfer.full?
    end
  end
end
