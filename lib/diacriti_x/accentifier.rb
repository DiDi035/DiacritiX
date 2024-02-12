require_relative 'rules/has_special_vietnamese_vowel'
require_relative 'rules/has_vietnamese_vowel'
require_relative 'rules/second_vowel'
require_relative 'rules/next_vowel'
require_relative 'rules/first_vowel'
require_relative 'response'

module DiacritiX
  class Accentifier
    ALL_RULES = [
      Rules::HasSpecialVietnameseVowel,
      Rules::HasVietnameseVowel,
      Rules::SecondVowel,
      Rules::NextVowel,
      Rules::FirstVowel
    ].freeze

    def self.call(input)
      ALL_RULES.each do |rule_klass|
        valid, index = rule_klass.check(input)
        return Response::Success.new(index) if valid
      end
      Response::Failure.new('Something is wrong')
    end
  end
end
