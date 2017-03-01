gem "oj", "2.18.1"

require "oj"

Oj.default_options = {:mode => :compat}

module Sensu
  module JSON
    # The Sensu JSON parser when running on MRI.
    class Oj
      # Load (and parse) a JSON string. Sensu expects symbolized keys.
      #
      # @param string [String]
      # @return [Object]
      def load(string)
        ::Oj.load(string, :symbol_keys => true)
      end

      # Dump (generate) a JSON string from a Ruby object.
      #
      # @param object [Object]
      # @param options [Hash]
      def dump(object, options={})
        options.merge!(:indent => 2) if options[:pretty]
        ::Oj.dump(object, options)
      end
    end
  end
end
