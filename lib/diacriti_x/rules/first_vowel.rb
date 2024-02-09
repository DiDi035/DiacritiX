module Rules
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
