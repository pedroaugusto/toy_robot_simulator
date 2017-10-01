require "toy_robot_simulator/version"

module ToyRobotSimulator
  autoload :Board, 'toy_robot_simulator/board'
  autoload :Robot, 'toy_robot_simulator/robot'

  module CommandInput
    autoload :FileCommandInput, 'toy_robot_simulator/command_input/file_command_input'
  end
end
