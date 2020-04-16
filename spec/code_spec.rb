require 'rspec'
require './src/code'

describe 'lalapopo' do
  it "returns false for odd numbers" do
    expect(lalapopo(1)).to eq(false)
    expect(lalapopo(3)).to eq(false)
  end

  it "returns true for even numbers" do
    expect(lalapopo(2)).to eq(true)
    expect(lalapopo(4)).to eq(true)
  end

  it "returns false for numbers between 10 and 15" do
    expect(lalapopo(10)).to eq(false)
    expect(lalapopo(11)).to eq(false)
    expect(lalapopo(14)).to eq(false)
    expect(lalapopo(15)).to eq(false)
    expect(lalapopo(16)).to eq(true)
  end
end