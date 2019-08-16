require "helix_runtime"

begin
  require "cash_flow_rust_helix/native"
rescue LoadError
  warn "Unable to load cash_flow_rust_helix/native. Please run `rake build`"
end
