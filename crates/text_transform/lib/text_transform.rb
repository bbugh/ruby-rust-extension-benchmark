require "helix_runtime"

begin
  require "text_transform/native"
rescue LoadError
  warn "Unable to load text_transform/native. Please run `rake build`"
end
