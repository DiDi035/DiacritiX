Gem::Specification.new do |s|
  s.name        = "diacriti_x"
  s.version     = "0.0.0"
  s.summary     = "Specify which letter in a Vietnamese word should accents be place above"
  s.description = "Specify which letter in a Vietnamese word should accents be place above"
  s.authors     = ["Di Huynh"]
  s.email       = "baodihuynh@gmail.com"
  s.files       = ["lib/diacriti_x.rb"]
  s.homepage    = "https://rubygems.org/gems/diacriti_x"
  s.license = "MIT"
  s.files = Dir.glob("{lib,bin}/**/*") # This includes all files under the lib directory recursively, so we don't have to add each one individually.
  s.require_path = 'lib'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
end
