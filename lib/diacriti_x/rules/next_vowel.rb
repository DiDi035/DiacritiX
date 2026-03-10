# frozen_string_literal: true

module DiacritiX
  module Rules
    class NextVowel
      SPECIAL_PAIR_CONSONANT = %w[gi qu].freeze

      def self.check(input)
        start_pair_consonant = input[0..1]
        return [true, input.index(start_pair_consonant[1]) + 1] if SPECIAL_PAIR_CONSONANT.include?(start_pair_consonant)

        [false, nil]
      end
    end
  end
end
