require "spec_helper"

describe ToyRobotSimulator::Robot do

  let(:board) { ToyRobotSimulator::Board.new }
  let(:robot) { ToyRobotSimulator::Robot.new(board) }

  describe "place" do

    context "when position is not valid" do
      it "do not store position" do
        robot.place(x: 10, y: 14)
        expect(board.current_x).to be_nil
        expect(board.current_y).to be_nil
        expect(robot.instance_variable_get(:@facing)).to be_nil
      end
    end

    context "when facing is not valid" do
      it "do not store position" do
        robot.place(x: 0, y: 0, facing: 'NORTHWEST')
        expect(board.current_x).to be_nil
        expect(board.current_y).to be_nil
        expect(robot.instance_variable_get(:@facing)).to be_nil
      end
    end

    context "when position is valid" do

      context "passing facing" do
        it "store position" do
          robot.place(x: 2, y: 3, facing: 'WEST')
          expect(board.current_x).to eq(2)
          expect(board.current_y).to eq(3)
          expect(robot.instance_variable_get(:@facing)).to eq('WEST')
        end
      end

      context "using default" do
        it "store position" do
          robot.place(x: 1, y: 4)
          expect(board.current_x).to eq(1)
          expect(board.current_y).to eq(4)
          expect(robot.instance_variable_get(:@facing)).to eq('NORTH')
        end
      end

    end

  end

end