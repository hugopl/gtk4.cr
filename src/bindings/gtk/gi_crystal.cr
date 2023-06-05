module GICrystal
  # Finalize a `Gtk::Expression` *object*.
  def finalize_instance(object : Gtk::Expression)
    LibGtk.gtk_expression_unref(object)
  end

  # Finalize a `Gtk::Window` *object*.
  def finalize_instance(object : Gtk::Window)
    # When we get here GTK already destroyed the object if it's a Window
  end
end
