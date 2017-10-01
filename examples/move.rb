$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "toy_robot_simulator"

# create board with default dimensions 5x5
board = ToyRobotSimulator::Board.new

# create robot
robot = ToyRobotSimulator::Robot.new(board)

puts "Place the robot in origin"

robot.place(x: 0, y: 0, facing: 'EAST')

# prints coordinates
robot.report

puts "move 4 times..."
4.times { robot.move }

# prints coordinates
robot.report

puts "one more..."
robot.move

# prints coordinates
robot.report