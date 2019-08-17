RSpec.describe CashFlowRustRutie do
  it 'has a version number' do
    expect(CashFlowRustRutie::VERSION).not_to be nil
  end

  it 'cash flows and flows' do
    expect(RustRutie.cash_flow(14_000.0, 8000.0, 8.0, 8, 4)).to eq(8162.933760000002)
  end
end
