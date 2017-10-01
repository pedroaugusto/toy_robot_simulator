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

  describe "report" do
    context "when robot is placed" do
      before { robot.place(x: 1, y: 1, facing: 'EAST' ) }

      it "prints the coordinates" do
        expect{ robot.report }.to output("1,1,EAST\n").to_stdout
      end
    end

    context "when robot is not placed" do
      it "prints a warning" do
        expect{ robot.report }.to output("Robot not placed yet.\n").to_stdout
      end
    end
  end

  describe "move" do
    context "when robot is placed" do

      context "when the next step would be inside board" do
        before { robot.place(x: 0, y: 4, facing: 'SOUTH' ) }

        it "change the robot position" do
          robot.move
          expect(board.current_y).to eq(3)
        end
      end

      context "when the next step would be outside board" do
        before { robot.place(x: 0, y: 4, facing: 'NORTH' ) }

        it "do not change the robot position" do
          robot.move
          expect(board.current_y).to eq(4)
        end
      end
    end

    context "when robot is not placed" do
      it "do not change the robot position" do
        robot.move
        expect(board.current_y).to be_nil
      end
    end
  end

  describe "right" do
    context "when robot is placed" do

      context "when the robot is facing NORTH" do
        before do
          robot.place(x: 0, y: 0, facing: 'NORTH' )
          robot.right
        end
        it { expect(robot.instance_variable_get(:@facing)).to eq('EAST') }
      end

      context "when the robot is facing EAST" do
        before do
          robot.place(x: 0, y: 0, facing: 'EAST' )
          robot.right
        end
        it { expect(robot.instance_variable_get(:@facing)).to eq('SOUTH') }
      end

      context "when the robot is facing SOUTH" do
        before do
          robot.place(x: 0, y: 0, facing: 'SOUTH' )
          robot.right
        end
        it { expect(robot.instance_variable_get(:@facing)).to eq('WEST') }
      end

      context "when the robot is facing WEST" do
        before do
          robot.place(x: 0, y: 0, facing: 'WEST' )
          robot.right
        end
        it { expect(robot.instance_variable_get(:@facing)).to eq('NORTH') }
      end

    end

    context "when robot is not placed" do
      it "do not change the robot position" do
        robot.right
        expect(board.current_y).to be_nil
      end
    end
  end

  describe "left" do
    context "when robot is placed" do

      context "when the robot is facing NORTH" do
        before do
          robot.place(x: 0, y: 0, facing: 'NORTH' )
          robot.left
        end
        it { expect(robot.instance_variable_get(:@facing)).to eq('WEST') }
      end

      context "when the robot is facing EAST" do
        before do
          robot.place(x: 0, y: 0, facing: 'EAST' )
          robot.left
        end
        it { expect(robot.instance_variable_get(:@facing)).to eq('NORTH') }
      end

      context "when the robot is facing SOUTH" do
        before do
          robot.place(x: 0, y: 0, facing: 'SOUTH' )
          robot.left
        end
        it { expect(robot.instance_variable_get(:@facing)).to eq('EAST') }
      end

      context "when the robot is facing WEST" do
        before do
          robot.place(x: 0, y: 0, facing: 'WEST' )
          robot.left
        end
        it { expect(robot.instance_variable_get(:@facing)).to eq('SOUTH') }
      end

    end

    context "when robot is not placed" do
      it "do not change the robot position" do
        robot.left
        expect(board.current_y).to be_nil
      end
    end
  end

end