# frozen_string_literal: true

module DiacritiX
  module Rules
    class SecondVowel
      SPECIAL_PAIR_VOWELS = %w[oa oe oo uy ươ].freeze

      def self.check(input)
        SPECIAL_PAIR_VOWELS.each do |vnmese_pair_vowels|
          return [true, input.index(vnmese_pair_vowels[1])] if input.include?(vnmese_pair_vowels)
        end

        [false, nil]
      end
    end
  end
end
