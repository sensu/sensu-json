require "json"

module Sensu
  module JSON
    # The Sensu JSON parser when running on JRuby.
    class Java
      # Load (and parse) a JSON string. Sensu expects symbolized keys.
      #
      # @param string [String]
      # @return [Object]
      def load(string)
        ::JSON.parse(string, :symbolize_names => true)
      end

      # Dump (generate) a JSON string from a Ruby object.
      #
      # @param object [Object]
      # @param options [Hash]
      def dump(object, options={})
        if options[:pretty]
          ::JSON.pretty_generate(object)
        else
          ::JSON.fast_generate(object)
        end
      end
    end
  end
end
