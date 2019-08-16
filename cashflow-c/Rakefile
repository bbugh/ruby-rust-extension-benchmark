require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rake/extensiontask"

task :build => :compile

Rake::ExtensionTask.new("example_ext") do |ext|
  ext.lib_dir = "lib/example_ext"
end

task :default => [:clobber, :compile, :spec]
