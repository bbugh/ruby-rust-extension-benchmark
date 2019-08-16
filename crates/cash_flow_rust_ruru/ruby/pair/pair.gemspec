lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'pair'
  s.version     = '0.0.1'
  s.date        = '2017-02-27'
  s.summary     = "pair finder"
  s.description = "A simple pair finder"
  s.authors     = ["Jonathan Chaput"]
  s.email       = 'piinkyz05@gmail.com'
  s.files       = ["lib/pair.rb", "native/libpair.dylib"]
  s.homepage    = 'https://github.com/squiidz/pair'
  s.license     = 'MIT'
end