# frozen_string_literal: true

require 'test_helper'

class AccentifierTest < Minitest::Test
  def test_special_vietnamese_vowel_takes_priority
    result = DiacritiX::Accentifier.call('hơn')

    assert result.success?
    assert_equal 1, result.result
  end

  def test_horn_u_takes_priority
    result = DiacritiX::Accentifier.call('mưa')

    assert result.success?
    assert_equal 1, result.result
  end

  def test_vietnamese_vowel_over_latin
    result = DiacritiX::Accentifier.call('tân')

    assert result.success?
    assert_equal 1, result.result
  end

  def test_second_vowel_oa
    result = DiacritiX::Accentifier.call('ngoay')

    assert result.success?
    assert_equal 3, result.result
  end

  def test_second_vowel_oe
    result = DiacritiX::Accentifier.call('xoe')

    assert result.success?
    assert_equal 2, result.result
  end

  def test_second_vowel_uy
    result = DiacritiX::Accentifier.call('quy')

    assert result.success?
    assert_equal 2, result.result
  end

  def test_next_vowel_qu
    result = DiacritiX::Accentifier.call('quay')

    assert result.success?
    assert_equal 2, result.result
  end

  def test_next_vowel_gi
    result = DiacritiX::Accentifier.call('giao')

    assert result.success?
    assert_equal 2, result.result
  end

  def test_first_vowel_fallback
    result = DiacritiX::Accentifier.call('ban')

    assert result.success?
    assert_equal 1, result.result
  end

  def test_consonants_only_returns_failure
    result = DiacritiX::Accentifier.call('bcd')

    assert result.failure?
    assert_nil result.result
  end

  def test_single_vowel
    result = DiacritiX::Accentifier.call('a')

    assert result.success?
    assert_equal 0, result.result
  end
end
