require "json"

module Sensu
  module JSON
    class Java
      def load(string)
        ::JSON.parse(string, :symbolize_names => true)
      end

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
