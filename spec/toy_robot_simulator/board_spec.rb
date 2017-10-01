require "spec_helper"

describe ToyRobotSimulator::Board do

  let(:board) { ToyRobotSimulator::Board.new }

  describe "place" do
    subject { board.place(4,3) }

    before { subject }

    it { expect(board.current_x).to eq(4) }
    it { expect(board.current_y).to eq(3) }
  end

  describe "valid_position?" do
    context "when the coordinates are not integers" do
      context "only x" do
        it { expect(board.valid_position?('string', 1)).to be_falsey }
      end

      context "only y" do
        it { expect(board.valid_position?(3, '4')).to be_falsey }
      end

      context "both x and y" do
        it { expect(board.valid_position?(false, '4')).to be_falsey }
      end
    end

    context "when coordinates are negative" do
      context "only x" do
        it { expect(board.valid_position?(-3, 1)).to be_falsey }
      end

      context "only y" do
        it { expect(board.valid_position?(3, -1)).to be_falsey }
      end

      context "both x and y" do
        it { expect(board.valid_position?(-10, -1)).to be_falsey }
      end
    end

    context "when coordinates do not inside board borders" do
      it { expect(board.valid_position?(5, 0)).to be_falsey }
      it { expect(board.valid_position?(0, 8)).to be_falsey }
      it { expect(board.valid_position?(9, 10)).to be_falsey }
    end

    context "when coordinates are inside board borders" do
      let(:indexes) { (0..4).to_a }

      it "all positions valid" do
        indexes.each do |i|
          indexes.each do |j|
            expect(board.valid_position?(i,j)).to be_truthy
          end
        end
      end
    end
  end

end