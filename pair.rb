require 'fiddle'
library = Fiddle::dlopen('crates/cash_flow_rust_ruru/ruby/pair/native/libpair.dylib')
Fiddle::Function.new(library['initialize'], [], Fiddle::TYPE_VOIDP).call

# arr = Array(0...200)
# puts arr.uniq_pairs

puts "--------"

def cash_flow(cash_in, cash_out, reinvest_rate, term, year)
  (cash_in - cash_out) * ((1.0 + (reinvest_rate / 100.0))**(term - year))
end

expected = cash_flow(10000, 800, 50, 30, 5)
actual = RustRuru.cash_flow(10000.0, 800.0, 50.0, 30, 5)
puts expected == actual, actual
