module Gdk
  enum ModifierType
    def none?
      # From GDK docs:
      #
      #   Note that GDK may add internal values to events which include reserved values such as
      #   GDK_MODIFIER_RESERVED_13_MASK. Your code should preserve and ignore them. You can use
      #   GDK_MODIFIER_MASK to remove all reserved values.
      #
      # We need this so `.none?` works as expected when there's hidden values in the enum
      (value & MODIFIER_MASK).zero?
    end
  end
end
