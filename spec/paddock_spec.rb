require 'spec_helper'

describe Paddock do
  let(:paddock) { Paddock.new }
  let(:sheepdog) { Sheepdog.new }

  before do
    paddock.top_right = "5 5"
  end

  it "has an x boundary" do
    expect(paddock.x_boundary).to eq(5)
  end

  it "has a y boundary" do
    expect(paddock.y_boundary).to eq(5)
  end

  context "space in paddock" do

    it "has space to the north" do
      expect(paddock.within_boundary?("5 5")).to be(true)
      expect(paddock.within_boundary?("5 6")).to be(false)
    end

    it "has space to the east" do
      expect(paddock.within_boundary?("5 5")).to be(true)
      expect(paddock.within_boundary?("6 5")).to be(false)
    end

    it "has space to the south" do
      expect(paddock.within_boundary?("0 0")).to be(true)
      expect(paddock.within_boundary?("0 -1")).to be(false)
    end

    it "has space to the west" do
      expect(paddock.within_boundary?("0 0")).to be(true)
      expect(paddock.within_boundary?("-1 0")).to be(false)
    end

  end
end
