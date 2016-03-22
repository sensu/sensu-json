require "sensu/json/parse_error"

# Sensu, monitoring for today's infrastructure.
module Sensu
  # The Sensu JSON parser abstraction library.
  module JSON
    # The Sensu JSON parser abstraction API.
    class << self
      # Set up the JSON parser. This method must be called before any
      # attempt to use the parser. The appropriate JSON parser will be
      # loaded for the current platform.
      #
      # @return [Object] parser.
      def setup!
        @@parser = case
        when RUBY_PLATFORM =~ /java/
          require "sensu/json/java"
          Sensu::JSON::Java.new
        else
          require "sensu/json/oj"
          Sensu::JSON::Oj.new
        end
      end

      # Load (and parse) a JSON string.
      #
      # @param string [String]
      # @return [Object]
      def load(string)
        begin
          @@parser.load(string)
        rescue => error
          raise Sensu::JSON::ParseError.build(error, string)
        end
      end

      # Dump (generate) a JSON string from a Ruby object.
      #
      # @param object [Object]
      # @param options [Hash]
      def dump(object, options={})
        @@parser.dump(object, options)
      end
    end
  end
end
