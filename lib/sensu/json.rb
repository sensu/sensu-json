require "sensu/json/parse_error"

module Sensu
  module JSON
    class << self
      def setup
        @@parser = case
        when RUBY_PLATFORM =~ /java/
          require "sensu/json/java"
          Sensu::JSON::Java.new
        else
          require "sensu/json/oj"
          Sensu::JSON::Oj.new
        end
      end

      def load(string)
        begin
          @@parser.load(string)
        rescue => error
          raise Sensu::JSON::ParseError.build(error, string)
        end
      end

      def dump(object, options={})
        @@parser.dump(object, options)
      end
    end
  end
end
