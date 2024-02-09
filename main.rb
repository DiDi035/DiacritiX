module Rules
  class HasSpecialVietnameseVowel
    SPECIAL_VIETNAMESE_VOWEL = 'ư'.freeze

    def self.check(input)
      [input.include?(SPECIAL_VIETNAMESE_VOWEL), input.index(SPECIAL_VIETNAMESE_VOWEL)]
    end
  end

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

  class NextVowel
    SPECIAL_PAIR_CONSONANT = ['gi', 'qu'].freeze

    def self.check(input)
      start_pair_consonant = input[0..1]
      if SPECIAL_PAIR_CONSONANT.include?(start_pair_consonant)
        return [true, input.index(start_pair_consonant[1])+1]
      end
    end
  end

  class FirstVowel
    LATIN_VOWELS = ['a', 'e', 'o', 'u', 'u', 'y', 'i'].freeze
    VIETNAMESE_VOWELS = ['ă', 'â', 'ê', 'ô', 'ơ', 'ư'].freeze

    def self.check(input)
      input.split('').each do |letter|
        if LATIN_VOWELS.include?(letter)
          return [true, input.index(letter)]
        elsif VIETNAMESE_VOWELS.include?(letter)
          return [true, input.index(letter)]
        end
      end

      [false, nil]
    end
  end
end

require 'colorize'

ALL_RULES = [
  Rules::HasSpecialVietnameseVowel,
  Rules::HasVietnameseVowel,
  Rules::SecondVowel,
  Rules::NextVowel,
  Rules::FirstVowel
]

running = true
input = ARGV[0]

ALL_RULES.each do |rule_klass|
  valid, index = rule_klass.check(input)

  if valid
    puts input[0..index-1]+input[index].green+input[index+1..input.length]
    return
  end
end

puts "Internal error".red
