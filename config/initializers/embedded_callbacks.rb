# encoding: utf-8
module Mongoid #:nodoc:
  module Associations #:nodoc:
    module EmbeddedCallbacks

      def _send_to_each_embedded_document(method, *args, &block)
        self.class.associations.each_pair do |name, meta|

          if meta.association == Mongoid::Associations::EmbedsMany
            assoc = self.send(name)
            assoc.each{|doc| doc.send(method, *args)} if assoc.present?

          elsif meta.association == Mongoid::Associations::EmbedsOne
            assoc = self.send(name)
            assoc.send(method, *args) if assoc.present?

          end
        end
      end


      # forward validation to embedded documents
      def valid?(*)
         _run_validation_callbacks { super }
         _send_to_each_embedded_document(:_run_validation_callbacks)
      end

      # bubble callbacks to embedded assocaitions
      def run_callbacks(kind, *args, &block)

        parent_callback_result = super(kind, *args, &block)  # defer to parent

        # now bubble callbacks down
        _send_to_each_embedded_document(:run_callbacks, kind, *args, &block)

        parent_callback_result
      end

    end
  end
end
