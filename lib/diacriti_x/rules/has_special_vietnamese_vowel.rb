# frozen_string_literal: true

module DiacritiX
  module Rules
    class HasSpecialVietnameseVowel
      SPECIAL_VIETNAMESE_VOWEL = %w[ơ ư].freeze

      def self.check(input)
        SPECIAL_VIETNAMESE_VOWEL.each do |special_vowel|
          return [true, input.index(special_vowel)] if input.include?(special_vowel)
        end

        [false, nil]
      end
    end
  end
end
