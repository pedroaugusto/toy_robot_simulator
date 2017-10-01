$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "toy_robot_simulator"


puts "running file example_a.txt commands in 5x5 board"

test_file = 'examples/test_files/example_a.txt'
file_command_input = ::ToyRobotSimulator::CommandInput::FileCommandInput.new(file_name: test_file)
file_command_input.scan

puts "running file example_b.txt commands in 5x5 board"

test_file = 'examples/test_files/example_b.txt'
file_command_input = ::ToyRobotSimulator::CommandInput::FileCommandInput.new(file_name: test_file)
file_command_input.scan

puts "running file example_c.txt commands in 5x5 board"

test_file = 'examples/test_files/example_c.txt'
file_command_input = ::ToyRobotSimulator::CommandInput::FileCommandInput.new(file_name: test_file)
file_command_input.scan