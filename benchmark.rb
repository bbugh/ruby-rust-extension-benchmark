# rubocop:disable all

require 'bundler/setup'

require 'benchmark/ips'
require 'cash_flow_rust_helix'
require 'cash_flow_c'

require 'ffi'
load 'crates/cash_flow_rust_ffi/src/cash_flow_rust_ffi.rb'

Benchmark::IPS.options[:format] = 'not human'

def cash_flow(cash_in, cash_out, reinvest_rate, term, year)
  (cash_in - cash_out) * ((1.0 + (reinvest_rate / 100.0))**(term - year))
end

rc = RustCalculations.new

raise 'rust helix fail' unless cash_flow(10000, 800, 50, 30, 5) == RustCalculations.cash_flow_class(10000, 800, 50, 30, 5)
raise 'rust ffi fail' unless cash_flow(10000, 800, 50, 30, 5) == RustFFI.cash_flow_class(10000, 800, 50, 30, 5)
raise 'c fail' unless cash_flow(10000, 800, 50, 30, 5) == CCalculations.cash_flow(10000, 800, 50, 30, 5)

Benchmark.ips do |x|
  x.report("ruby method") { cash_flow(10000, 800, 50, 30, 5) }

  x.report("rust helix instance") { rc.cash_flow(10000, 800, 50, 30, 5) }
  x.report("rust helix class") { RustCalculations.cash_flow_class(10000, 800, 50, 30, 5) }

  x.report("rust ffi class") { RustFFI.cash_flow_class(10000, 800, 50, 30, 5) }

  x.report("c class") { CCalculations.cash_flow(10000, 800, 50, 30, 5) }
end
