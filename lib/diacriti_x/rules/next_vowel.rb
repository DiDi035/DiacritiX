 module Rules
  class NextVowel
    SPECIAL_PAIR_CONSONANT = ['gi', 'qu'].freeze

    def self.check(input)
      start_pair_consonant = input[0..1]
      if SPECIAL_PAIR_CONSONANT.include?(start_pair_consonant)
        return [true, input.index(start_pair_consonant[1])+1]
      end
    end
  end
end
