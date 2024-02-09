module DiacritiX
  module Response
    class Success
      def initialize(index)
        @index = index
      end

      def success?
        true
      end

      def failure?
        false
      end

      def index
        @index
      end
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

      def message
        @message
      end
    end
  end
end
