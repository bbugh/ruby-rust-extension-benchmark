# require 'helix-rails/tasks/helix
# require 'helix_runtime/tasks'

require 'bundler/setup'
# require "bundler/gem_tasks"
# require 'helix_runtime/build_task'

# HelixRuntime::BuildTask.new do |t|
#   t.build_root = File.expand_path(".", __dir__)
#   t.helix_lib_dir = File.expand_path(".", __dir__)
#   t.pre_build = HelixRuntime::Tests.pre_build
# end

require 'helix_runtime/parent_build_task'

HelixRuntime::ParentBuildTask.new
