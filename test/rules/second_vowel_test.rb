# frozen_string_literal: true

require 'test_helper'

class SecondVowelTest < Minitest::Test
  def test_oa_pair
    valid, index = DiacritiX::Rules::SecondVowel.check('ngoay')

    assert valid
    assert_equal 3, index
  end

  def test_oe_pair
    valid, index = DiacritiX::Rules::SecondVowel.check('xoe')

    assert valid
    assert_equal 2, index
  end

  def test_uy_pair
    valid, index = DiacritiX::Rules::SecondVowel.check('quy')

    assert valid
    assert_equal 2, index
  end

  def test_no_special_pair
    valid, = DiacritiX::Rules::SecondVowel.check('ban')

    refute valid
  end
end
