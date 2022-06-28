module Gdk
  class Event
    def initialize(@pointer : Pointer(Void), transfer : GICrystal::Transfer)
      LibGdk.gdk_event_ref(@pointer) unless transfer.full?
    end
  end
end
