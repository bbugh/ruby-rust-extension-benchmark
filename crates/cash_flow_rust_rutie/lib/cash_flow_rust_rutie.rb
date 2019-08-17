require "cash_flow_rust_rutie/version"
require 'rutie'

module CashFlowRustRutie
  class Error < StandardError; end

  Rutie.new(:cash_flow_rust_rutie).init 'Init_cash_flow_rust_rutie', __dir__
  # Your code goes here...
end
