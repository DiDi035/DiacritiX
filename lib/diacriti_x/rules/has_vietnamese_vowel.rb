module Rules
  class HasVietnameseVowel
    VIETNAMESE_VOWELS = ['ă', 'â', 'ê', 'ô', 'ơ', 'ư'].freeze

    def self.check(input)
      VIETNAMESE_VOWELS.each do |vnmese_vowel|
        if input.include?(vnmese_vowel)
          return [true, input.index(vnmese_vowel)]
        end
      end

      [false, nil]
    end
  end
end
