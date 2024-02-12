module DiacritiX
  module Rules
    class HasSpecialVietnameseVowel
      SPECIAL_VIETNAMESE_VOWEL = ['ơ', 'ư'].freeze

      def self.check(input)
        validation_result = [false, nil]
        SPECIAL_VIETNAMESE_VOWEL.each do |special_vowel|
          if input.include?(special_vowel)
            validation_result = [true, input.index(special_vowel)]
            break
          end
        end
        validation_result
      end
    end
  end
end
