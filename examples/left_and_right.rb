$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "toy_robot_simulator"

# create board with default dimensions 5x5
board = ToyRobotSimulator::Board.new

# create robot
robot = ToyRobotSimulator::Robot.new(board)

puts "Place the robot in origin facing NORTH (default)"

robot.place(x: 0, y: 0)

# prints coordinates
robot.report

8.times do
  puts "rotates clockwise..."
  robot.right
  robot.report
end

8.times do
  puts "rotates counter clockwise..."
  robot.left
  robot.report
end
