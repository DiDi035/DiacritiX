# frozen_string_literal: true

require_relative '../constants'

module DiacritiX
  module Rules
    class FirstVowel
      LATIN_VOWELS = %w[a e i o u y].freeze

      def self.check(input)
        input.each_char.with_index do |letter, index|
          return [true, index] if LATIN_VOWELS.include?(letter) || Constants::VIETNAMESE_VOWELS.include?(letter)
        end

        [false, nil]
      end
    end
  end
end
