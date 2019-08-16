require "helix_runtime"

begin
  require "cash_flow_rust/native"
rescue LoadError
  warn "Unable to load cash_flow_rust/native. Please run `rake build`"
end
