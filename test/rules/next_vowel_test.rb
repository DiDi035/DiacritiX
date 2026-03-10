# frozen_string_literal: true

require 'test_helper'

class NextVowelTest < Minitest::Test
  def test_qu_pair
    valid, index = DiacritiX::Rules::NextVowel.check('quay')

    assert valid
    assert_equal 2, index
  end

  def test_gi_pair
    valid, index = DiacritiX::Rules::NextVowel.check('giao')

    assert valid
    assert_equal 2, index
  end

  def test_no_consonant_pair
    valid, index = DiacritiX::Rules::NextVowel.check('ban')

    refute valid
    assert_nil index
  end
end
