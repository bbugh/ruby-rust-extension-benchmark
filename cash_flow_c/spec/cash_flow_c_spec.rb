RSpec.describe CCalculations do
  it "has a version number" do
    expect(CCalculations::VERSION).not_to be nil
  end

  describe "#cash_flow" do
    it "does a cash flow" do
      expect(CCalculations.cash_flow(1000, 800, 50, 30, 5)).to eq 5050233.65880847
    end

    it 'does a small cash flow' do
      expect(CCalculations.cash_flow(100, 80, 5, 30, 1)).to eq 82.32271190763177
    end

    it 'does a huge cash flow wow' do
      expect(CCalculations.cash_flow(10000, 800, 50, 30, 5)).to eq 232310748.3051896
    end
  end
end
