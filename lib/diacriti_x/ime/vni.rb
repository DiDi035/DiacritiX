# frozen_string_literal: true

require_relative '../constants'
require_relative '../accentifier'

module DiacritiX
  module IME
    class VNI
      SPECIAL_HORN_MAPPINGS = { 'uo' => 'ươ' }.freeze
      DYET_KEY = '9'
      HORN_KEY = '7'
      ACCENT_MAPPINGS = {
        '1' => Constants::ACCUTE_MAPPINGS,
        '2' => Constants::GRAVE_MAPPINGS,
        '3' => Constants::HOOK_ABOVE_MAPPINGS,
        '4' => Constants::TIDLE_MAPPINGS,
        '5' => Constants::DOT_MAPPINGS,
        '6' => Constants::CIRCUMFLEX_MAPPINGS,
        '7' => Constants::HORN_MAPPINGS,
        '8' => Constants::BREVE_MAPPINGS,
        '9' => Constants::DYET_MAPPINGS
      }.freeze

      def call(text)
        accent_mappings, accent_index, sanitized_text, transformed_text = extract_accent_mapping(text)
        return transformed_text if accent_mappings.nil?

        accentify_result = accentify(sanitized_text)
        return transformed_text if accentify_result.failure?

        accentify_index = accentify_result.result
        return transformed_text if accent_index < transformed_text.index(sanitized_text[accentify_index])

        sanitized_text
          .gsub(
            sanitized_text[accentify_index],
            accent_mappings[sanitized_text[accentify_index]]
          )
      end

      private

      attr_reader :accentifier

      def extract_accent_mapping(text)
        transformed_text = text.dup
        sanitized_text = text.dup
        accent_mappings = nil
        accent_index = nil
        dyet_char = nil
        special_horn_char = nil
        text.split('').each_with_index do |char, idx|
          dyet_char = char if Constants::DYET_MAPPINGS.include?(char)

          special_horn_char = text[(idx - 1)..idx] if idx.positive? && !SPECIAL_HORN_MAPPINGS[text[(idx - 1)..idx]].nil?

          next unless ACCENT_MAPPINGS.include?(char)

          if char == DYET_KEY
            next if dyet_char.nil?

            transformed_text.delete!(char)
            transformed_text.gsub!(dyet_char, Constants::DYET_MAPPINGS[dyet_char])
            next
          end

          if char == HORN_KEY && !special_horn_char.nil?
            transformed_text.delete!(char)
            transformed_text.gsub!(special_horn_char, SPECIAL_HORN_MAPPINGS[special_horn_char])
            next
          end

          sanitized_text.delete!(char)
          accent_index = idx
          accent_mappings = ACCENT_MAPPINGS[char]
          sanitized_text = call(sanitized_text)

          transformed_text = sanitized_text.dup
          if accent_index >= transformed_text.size
            transformed_text += char
          else
            transformed_text.insert(accent_index, char)
          end

          break
        end

        [accent_mappings, accent_index, sanitized_text, transformed_text]
      end

      def accentify(text)
        Accentifier.call(text)
      end
    end
  end
end
