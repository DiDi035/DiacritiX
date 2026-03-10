# frozen_string_literal: true

require 'test_helper'

class HasVietnameseVowelTest < Minitest::Test
  def test_finds_circumflex_a
    valid, index = DiacritiX::Rules::HasVietnameseVowel.check('tân')

    assert valid
    assert_equal 1, index
  end

  def test_finds_breve_a
    valid, index = DiacritiX::Rules::HasVietnameseVowel.check('ăn')

    assert valid
    assert_equal 0, index
  end

  def test_no_vietnamese_vowel
    valid, = DiacritiX::Rules::HasVietnameseVowel.check('ban')

    refute valid
  end
end
