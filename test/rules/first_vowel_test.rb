# frozen_string_literal: true

require 'test_helper'

class FirstVowelTest < Minitest::Test
  def test_finds_first_latin_vowel
    valid, index = DiacritiX::Rules::FirstVowel.check('ban')

    assert valid
    assert_equal 1, index
  end

  def test_finds_vietnamese_vowel
    valid, index = DiacritiX::Rules::FirstVowel.check('bân')

    assert valid
    assert_equal 1, index
  end

  def test_vowel_at_start
    valid, index = DiacritiX::Rules::FirstVowel.check('an')

    assert valid
    assert_equal 0, index
  end

  def test_no_vowel
    valid, index = DiacritiX::Rules::FirstVowel.check('bcd')

    refute valid
    assert_nil index
  end
end
