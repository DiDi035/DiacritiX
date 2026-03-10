# frozen_string_literal: true

require 'test_helper'

class HasSpecialVietnameseVowelTest < Minitest::Test
  def test_finds_horn_o
    valid, index = DiacritiX::Rules::HasSpecialVietnameseVowel.check('hơn')

    assert valid
    assert_equal 1, index
  end

  def test_finds_horn_u
    valid, index = DiacritiX::Rules::HasSpecialVietnameseVowel.check('mưa')

    assert valid
    assert_equal 1, index
  end

  def test_no_special_vowel
    valid, = DiacritiX::Rules::HasSpecialVietnameseVowel.check('ban')

    refute valid
  end
end
