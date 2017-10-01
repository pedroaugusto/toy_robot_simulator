$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "toy_robot_simulator"

# create board with default dimensions 5x5
board = ToyRobotSimulator::Board.new

# create robot
robot = ToyRobotSimulator::Robot.new(board)

puts "trying to put robot in a invalid place..."

# place robot in an invalid position
robot.place(x: -3, y: 50, facing: 'WEST')

# prints coordinates
robot.report

puts "trying to put robot in a valid place..."

# place robot in a valid position
robot.place(x: 3, y: 3, facing: 'WEST')

# prints coordinates
robot.report
