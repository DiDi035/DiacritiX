# frozen_string_literal: true

module DiacritiX
  module IME
    class Telex
      ACCENT_MAPPINGS = {
        's' => Constants::ACCUTE_MAPPINGS,
        'f' => Constants::GRAVE_MAPPINGS,
        'r' => Constants::HOOK_ABOVE_MAPPINGS,
        'x' => Constants::TIDLE_MAPPINGS,
        'j' => Constants::DOT_MAPPINGS
      }.freeze
    end
  end
end
