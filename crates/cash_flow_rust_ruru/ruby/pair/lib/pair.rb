require 'fiddle'
library = Fiddle::dlopen("#{File.dirname(__FILE__)}/../native/libpair.dylib")
Fiddle::Function.new(library['initialize'], [], Fiddle::TYPE_VOIDP).call