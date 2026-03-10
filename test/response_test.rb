# frozen_string_literal: true

require 'test_helper'

class ResponseSuccessTest < Minitest::Test
  def test_success
    response = DiacritiX::Response::Success.new(3)

    assert response.success?
    refute response.failure?
  end
end

class ResponseFailureTest < Minitest::Test
  def test_failure
    response = DiacritiX::Response::Failure.new('error')

    refute response.success?
    assert response.failure?
  end
end
