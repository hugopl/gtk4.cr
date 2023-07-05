module Gtk
  class MessageDialog
    {% for type in %w(ok close cancel yes_no ok_cancel) %}
      def self.{{ type.id }}(*, message_type : MessageType? = nil,
                  title : ::String? = nil,
                  text : ::String? = nil,
                  secondary_text : ::String? = nil, secondary_use_markup : Bool? = nil,
                  use_markup : Bool? = nil, transient_for : Window? = nil,
                  modal : Bool = true,
                  &block : Proc(Int32, Nil)) : Nil
        dlg = MessageDialog.new(message_type: message_type,
          buttons: :{{ type.id }},
          title: title,
          text: text,
          secondary_text: secondary_text, secondary_use_markup: secondary_use_markup,
          use_markup: use_markup,
          modal: modal,
          transient_for: transient_for)
        dlg.response_signal.connect do |response|
          block.call(response)
        ensure
          dlg.destroy
        end
        dlg.show
      end
    {% end %}
  end
end
