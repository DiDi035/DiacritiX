# frozen_string_literal: true

require 'colorize'
require_relative 'diacriti_x/accentifier'
require_relative 'diacriti_x/ime/vni'

module DiacritiX
  module Cli
    class << self
      def accentify(input)
        response = Accentifier.call(input)

        if response.success?
          index = response.result
          puts input[0..index - 1] + input[index].green + input[index + 1..input.length]
        else
          puts response.message.red
        end
      end
    end

    module IME
      class VNI
        class << self
          def call(input)
            transformed_text = DiacritiX::IME::VNI.new.call(input)

            puts transformed_text.green
          end
        end
      end
    end
  end
end
