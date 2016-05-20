require "jrjackson"

module Sensu
  module JSON
    # The Sensu JSON parser when running on JRuby.
    class JrJackson
      # Load (and parse) a JSON string. Sensu expects symbolized keys.
      #
      # @param string [String]
      # @return [Object]
      def load(string)
        ::JrJackson::Json.load(string, :symbolize_keys => true, :raw => true)
      end

      # Dump (generate) a JSON string from a Ruby object.
      #
      # @param object [Object]
      # @param options [Hash]
      def dump(object, options={})
        ::JrJackson::Json.dump(object, options)
      end
    end
  end
end
