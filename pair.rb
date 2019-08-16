require 'fiddle'
library = Fiddle::dlopen('crates/cash_flow_rust_ruru/ruby/pair/native/libpair.dylib')
Fiddle::Function.new(library['initialize'], [], Fiddle::TYPE_VOIDP).call

arr = Array(0...200)
puts arr.uniq_pairs
