RSpec.describe ExampleExt do
  it "has a version number" do
    expect(ExampleExt::VERSION).not_to be nil
  end

  it "does a nil thing" do
    expect(ExampleExt.hello).to be nil
    # expect(false).to eq(true)
  end

  it "sums things" do
    expect(ExampleExt.sum(5, 10)).to eq 15
    # expect(false).to eq(true)
  end

  fdescribe "#cash_flow" do
    it "does a cash flow bro" do
      expect(ExampleExt.cash_flow(1000, 800, 50, 30, 5)).to eq 5050233.65880847
      # expect(false).to eq(true)
    end

    it 'does a small cash flow dude' do
      expect(ExampleExt.cash_flow(100, 80, 5, 30, 1)).to eq 82.32271190763177
    end

    it 'does a huge cash flow' do
      expect(ExampleExt.cash_flow(10000, 800, 50, 30, 5)).to eq 232310748.3051896
    end
  end
end
