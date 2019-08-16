# encoding: utf-8

Gem::Specification.new do |s|
  s.name         = 'cash_flow_rust'
  s.version      = '1.0.0'
  s.authors      = ['Ruby Developer']
  s.summary      = "A Helix project"
  s.files        = Dir['{lib/**/*,[A-Z]*}']

  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'

  s.add_dependency 'helix_runtime', '~> 0.7.5'
end
