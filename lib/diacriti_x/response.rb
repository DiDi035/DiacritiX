module DiacritiX
  module Response
    class Success
      def initialize(result)
        @result = result
      end

      def success?
        true
      end

      def failure?
        false
      end

      def message
        nil
      end

      attr_reader :result
    end

    class Failure
      def initialize(message)
        @message = message
      end

      def success?
        false
      end

      def failure?
        true
      end

      def result
        nil
      end

      attr_reader :message
    end
  end
end
