require_relative '../constants'

module DiacritiX
  module Rules
    class FirstVowel
      LATIN_VOWELS = ['a', 'e', 'o', 'u', 'u', 'y', 'i'].freeze

      def self.check(input)
        input.split('').each do |letter|
          if LATIN_VOWELS.include?(letter)
            return [true, input.index(letter)]
          elsif ::Constants::VIETNAMESE_VOWELS.include?(letter)
            return [true, input.index(letter)]
          end
        end

        [false, nil]
      end
    end
  end
end
