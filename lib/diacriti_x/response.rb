# frozen_string_literal: true

module DiacritiX
  module Response
    class Success
      attr_reader :result

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
    end

    class Failure
      attr_reader :message

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
    end
  end
end
