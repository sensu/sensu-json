gem "oj", "2.14.6"

require "oj"

module Sensu
  module JSON
    class Oj
      def load(string)
        ::Oj.load(string, :symbol_keys => true)
      end

      def dump(object, options={})
        options.merge!(:indent => 2) if options[:pretty]
        ::Oj.dump(object, options)
      end
    end
  end
end
