 module Rules
  class SecondVowel
    SPECIAL_PAIR_VOWELS = ['oa', 'oe', 'oo', 'uy'].freeze

    def self.check(input)
      SPECIAL_PAIR_VOWELS.each do |vnmese_pair_vowels|
        if input.include?(vnmese_pair_vowels)
          return [true, input.index(vnmese_pair_vowels[1])]
        end
      end

      [false, nil]
    end
  end
end
