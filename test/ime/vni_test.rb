# frozen_string_literal: true

require 'test_helper'

class VNITest < Minitest::Test
  def setup
    @vni = DiacritiX::IME::VNI.new
  end

  def test_acute
    assert_equal 'tói', @vni.call('toi1')
  end

  def test_grave
    assert_equal 'tòi', @vni.call('toi2')
  end

  def test_hook_above
    assert_equal 'tỏi', @vni.call('toi3')
  end

  def test_tilde
    assert_equal 'tõi', @vni.call('toi4')
  end

  def test_dot_below
    assert_equal 'tọi', @vni.call('toi5')
  end

  def test_circumflex
    assert_equal 'ôi', @vni.call('oi6')
  end

  def test_horn_uo
    assert_equal 'ương', @vni.call('uo7ng')
  end

  def test_breve
    assert_equal 'ăn', @vni.call('an8')
  end

  def test_dyet
    assert_equal 'đi', @vni.call('di9')
  end

  def test_no_accent_key
    assert_equal 'toi', @vni.call('toi')
  end

  def test_plain_text_passthrough
    assert_equal 'abc', @vni.call('abc')
  end
end
