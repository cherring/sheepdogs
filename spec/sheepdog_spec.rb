require 'spec_helper'

describe Sheepdog do
  let(:paddock) { Paddock.new }
  let(:sheepdog) { Sheepdog.new }

  before do
    paddock.top_right = "5 5"
    paddock.add_sheepdog(sheepdog)
  end

  it "knows it's starting position" do
    sheepdog.starting_position = "3 3 E"
    expect(sheepdog.x).to eq(3)
    expect(sheepdog.y).to eq(3)
    expect(sheepdog.position).to eq("3 3 E")
  end

  context "changing direction" do
    before do
      sheepdog.starting_position = "3 3 E"
    end

    it "can turn left" do
      sheepdog.turn "L"
      expect(sheepdog.direction).to eq("N")
    end

    it "can turn right" do
      sheepdog.turn "R"
      expect(sheepdog.direction).to eq("S")
    end
  end

  context "Moving" do

    it "can move North" do
      sheepdog.starting_position = "3 3 N"
      sheepdog.move
      expect(sheepdog.position).to eq("3 4 N")
    end

    it "can move East" do
      sheepdog.starting_position = "3 3 E"
      sheepdog.move
      expect(sheepdog.position).to eq("4 3 E")
    end

    it "can move South" do
      sheepdog.starting_position = "3 3 S"
      sheepdog.move
      expect(sheepdog.position).to eq("3 2 S")
    end

    it "can move West" do
      sheepdog.starting_position = "3 3 W"
      sheepdog.move
      expect(sheepdog.position).to eq("2 3 W")
    end

    it "can't leave the paddock going north" do
      sheepdog.starting_position = "5 5 N"
      expect(sheepdog.move).to eq("Sheepdog can't leave the paddock")
      expect(sheepdog.position).to eq("5 5 N")
    end

    it "can't leave the paddock going east" do
      sheepdog.starting_position = "5 5 E"
      expect(sheepdog.move).to eq("Sheepdog can't leave the paddock")
      expect(sheepdog.position).to eq("5 5 E")
    end

    it "can't leave the paddock going south" do
      sheepdog.starting_position = "0 0 S"
      expect(sheepdog.move).to eq("Sheepdog can't leave the paddock")
      expect(sheepdog.position).to eq("0 0 S")
    end

    it "can't leave the paddock going west" do
      sheepdog.starting_position = "0 0 W"
      expect(sheepdog.move).to eq("Sheepdog can't leave the paddock")
      expect(sheepdog.position).to eq("0 0 W")
    end

    it "can't go into a spot where there is another sheepdog" do
      sheepdog.starting_position = "0 0 W"
      new_sheepdog = Sheepdog.new
      paddock.add_sheepdog(new_sheepdog)
      new_sheepdog.starting_position = "0 1 S"
      expect(new_sheepdog.move).to eq("Sheepdog can't run through another sheepdog")
      expect(new_sheepdog.position).to eq("0 1 S")
    end


  end

end
