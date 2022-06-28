module GICrystal
  # Finalize *object*.
  def finalize_instance(object : Gtk::Expression)
    LibGtk.gtk_expression_unref(object)
  end
end
