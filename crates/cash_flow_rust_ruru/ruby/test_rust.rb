require 'fiddle'
library = Fiddle::dlopen('pair/native/libpair.dylib')
Fiddle::Function.new(library['initialize'], [], Fiddle::TYPE_VOIDP).call

arr = Array(0...200)
puts arr.uniq_pairs
