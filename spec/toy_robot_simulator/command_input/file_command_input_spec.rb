require 'spec_helper'

describe ToyRobotSimulator::CommandInput::FileCommandInput do

  let(:file_command_input) { ToyRobotSimulator::CommandInput::FileCommandInput.new file_name: 'spec/files/test.txt' }

  describe "scan" do
    it "run lines" do
      expect(file_command_input).to receive(:run_command).exactly(7)
      file_command_input.scan
    end
  end

  describe "run_command" do
    context "when place command" do
      subject { file_command_input.run_command("PLACE 0,0,WEST") }

      it "runs command with parameters" do
        expect_any_instance_of(ToyRobotSimulator::Robot).to receive(:place).with(x: 0, y: 0, facing: 'WEST')
        subject
      end
    end

    context "when move command" do
      subject { file_command_input.run_command("MOVE") }

      it "runs command" do
        expect_any_instance_of(ToyRobotSimulator::Robot).to receive(:move)
        subject
      end
    end

    context "when report command" do
      subject { file_command_input.run_command("REPORT") }

      it "runs command" do
        expect_any_instance_of(ToyRobotSimulator::Robot).to receive(:report)
        subject
      end
    end

    context "when left command" do
      subject { file_command_input.run_command("LEFT") }

      it "runs command" do
        expect_any_instance_of(ToyRobotSimulator::Robot).to receive(:left)
        subject
      end
    end

    context "when right command" do
      subject { file_command_input.run_command("RIGHT") }

      it "runs command" do
        expect_any_instance_of(ToyRobotSimulator::Robot).to receive(:right)
        subject
      end
    end

    context "when valid command with trailing spaces" do
      subject { file_command_input.run_command("       MOVE   ") }

      it "runs command" do
        expect_any_instance_of(ToyRobotSimulator::Robot).to receive(:move)
        subject
      end
    end

    context "when valid command with line break" do
      subject { file_command_input.run_command("LEFT\n\n") }

      it "runs command" do
        expect_any_instance_of(ToyRobotSimulator::Robot).to receive(:left)
        subject
      end
    end

    context "when valid command with spaces between parameters" do
      subject { file_command_input.run_command("       PLACE    0   ,    1    ,   EAST   ") }

      it "runs command with parameters" do
        expect_any_instance_of(ToyRobotSimulator::Robot).to receive(:place).with(x: 0, y: 1, facing: 'EAST')
        subject
      end
    end

    context "when invalid command" do
      subject { file_command_input.run_command("JUMP") }

      it "prints error" do
        expect { subject }.to output("Invalid command: JUMP\n").to_stdout
      end
    end
  end

end