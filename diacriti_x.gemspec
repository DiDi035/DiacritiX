# frozen_string_literal: true

require_relative 'lib/diacriti_x/version'

Gem::Specification.new do |s|
  s.name        = 'diacriti_x'
  s.version     = DiacritiX::VERSION
  s.summary     = 'Vietnamese diacritics placement and IME input'
  s.description = 'Determines which letter in a Vietnamese word should receive accent marks, ' \
                  'and provides IME input methods (VNI) for typing Vietnamese.'
  s.authors     = ['Di Huynh']
  s.email       = 'baodihuynh@gmail.com'
  s.files       = Dir.glob('{lib,bin}/**/*') + %w[README.md CHANGELOG.md]
  s.bindir      = 'bin'
  s.executables = ['accentify']
  s.require_path = 'lib'
  s.homepage    = 'https://github.com/DiDi035/DiacritiX'

  s.required_ruby_version = '>= 3.3'

  s.add_dependency 'colorize', '~> 1.1'

  s.metadata = {
    'source_code_uri' => 'https://github.com/DiDi035/DiacritiX',
    'changelog_uri' => 'https://github.com/DiDi035/DiacritiX/blob/master/CHANGELOG.md',
    'rubygems_mfa_required' => 'true'
  }
end
