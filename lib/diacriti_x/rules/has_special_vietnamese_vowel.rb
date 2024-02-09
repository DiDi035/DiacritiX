 module Rules
  class HasSpecialVietnameseVowel
    SPECIAL_VIETNAMESE_VOWEL = 'ư'.freeze

    def self.check(input)
      [input.include?(SPECIAL_VIETNAMESE_VOWEL), input.index(SPECIAL_VIETNAMESE_VOWEL)]
    end
  end
end
