# frozen_string_literal: true

require 'ffi'

module RustFFI
  extend FFI::Library
  ffi_lib File.join(__dir__, '..', 'target', 'debug', 'libdouble_input.' + FFI::Platform::LIBSUFFIX)
  attach_function :cash_flow_class, %i[double double double int32 int32], :double
end

# def ruby_cash_flow(cash_in, cash_out, reinvest_rate, term, year)
#   (cash_in - cash_out) * ((1.0 + (reinvest_rate / 100.0))**(term - year))
# end

# # input = 4
# output = RustFFI.cash_flow(14000.0, 8000.0, 8.0, 8, 4)
# expected = ruby_cash_flow(14000.0, 8000.0, 8.0, 8, 4)
# puts "cash_flow(14000.0, 8000.0, 8.0, 8, 4) = #{output}, expected = #{expected}, match #{output == expected}"

# output = RustFFI.cash_flow(100, 80, 5, 30, 1)
# expected = ruby_cash_flow(100, 80, 5, 30, 1)
# puts "cash_flow(100, 80, 5, 30, 1) = #{output}, expected = #{expected}, match #{output == expected}"
# # puts "#{input} * 2 = #{output}"
