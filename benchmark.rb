# rubocop:disable all

require 'bundler/setup'
require 'benchmark/ips'

Benchmark::IPS.options[:format] = 'not human'

Benchmark.ips do |x|
  # ========================================
  # Standard Ruby method
  # ========================================
  def cash_flow(cash_in, cash_out, reinvest_rate, term, year)
    (cash_in - cash_out) * ((1.0 + (reinvest_rate / 100.0))**(term - year))
  end

  x.report("ruby method") { cash_flow(10000, 800, 50, 30, 5) }


  # ========================================
  # Rust using Helix as an instance method
  # ========================================
  require 'cash_flow_rust_helix'
  rc = RustCalculations.new
  raise 'rust helix instance fail' unless cash_flow(10000, 800, 50, 30, 5) == rc.cash_flow(10000, 800, 50, 30, 5)

  x.report("rust helix instance") { rc.cash_flow(10000, 800, 50, 30, 5) }


  # ========================================
  # Rust using Helix as a class method
  # ========================================
  require 'cash_flow_rust_helix'
  raise 'rust helix class method fail' unless cash_flow(10000, 800, 50, 30, 5) == RustCalculations.cash_flow_class(10000, 800, 50, 30, 5)

  x.report("rust helix class") { RustCalculations.cash_flow_class(10000, 800, 50, 30, 5) }


  # ========================================
  # Rust using FFI class method
  # ========================================
  require 'ffi'
  load 'crates/cash_flow_rust_ffi/src/cash_flow_rust_ffi.rb'
  x.report("rust ffi class") { RustFFI.cash_flow_class(10000, 800, 50, 30, 5) }


  # ========================================
  # Rust using Ruru class method
  # ========================================
  require 'fiddle'
  library = Fiddle::dlopen('crates/cash_flow_rust_ruru/ruby/pair/native/libcash_flow_rust_ruru.dylib')
  Fiddle::Function.new(library['initialize'], [], Fiddle::TYPE_VOIDP).call

  x.report("rust ruru class") { RustRuru.cash_flow(10000.0, 800.0, 50.0, 30, 5) }


  # ========================================
  # Rust using rutie class method
  # ========================================
  require 'cash_flow_rust_rutie'
  raise 'rust rutie class method fail' unless cash_flow(10000, 800, 50, 30, 5) == RustRutie.cash_flow(10000.0, 800.0, 50.0, 30, 5)

  x.report("rust rutie class") { RustRutie.cash_flow(10000.0, 800.0, 50.0, 30, 5) }

  # ========================================
  # Rust using magnus class method
  # ========================================
  require 'cash_flow_rust_magnus'
  raise 'rust magnus class method fail' unless cash_flow(10000, 800, 50, 30, 5) == RustMagnus.cash_flow(10000.0, 800.0, 50.0, 30, 5)

  x.report("rust magnus class") { RustMagnus.cash_flow(10000.0, 800.0, 50.0, 30, 5) }

  # ====================================
  # C using standard Ruby extension
  # ====================================
  require 'cash_flow_c'
  x.report("c class") { CCalculations.cash_flow(10000, 800, 50, 30, 5) }

  x.compare!
end
