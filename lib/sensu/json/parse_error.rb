module Sensu
  module JSON
    # The Sensu JSON parser error abstraction.
    class ParseError < StandardError
      attr_reader :data, :cause

      # Produce an encapsulating error for a parser error, maintaining
      # the backtrace.
      #
      # @param original_error [Object]
      # @param data [Object] (such as a JSON string).
      def self.build(original_error, data)
        new(original_error.message).tap do |error|
          error.instance_eval do
            @cause = original_error
            set_backtrace original_error.backtrace
            @data = data
          end
        end
      end
    end
  end
end
