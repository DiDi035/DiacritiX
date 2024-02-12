require_relative '../constants'

module DiacritiX
  module Rules
    class HasVietnameseVowel
      def self.check(input)
        ::Constants::VIETNAMESE_VOWELS.each do |vnmese_vowel|
          if input.include?(vnmese_vowel)
            return [true, input.index(vnmese_vowel)]
          end
        end

        [false, nil]
      end
    end
  end
end
