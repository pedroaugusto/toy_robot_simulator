# ToyRobotSimulator

This Gem simulates the behaviour of a toy robot over a matrix board. It provides commands to move the robot avoiding it
to get out of the board.

## Setup

- Ruby-2.4.1

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'toy_robot_simulator', :git => 'git@github.com:pedroaugusto/toy_robot_simulator.git'
```

And then execute:

    $ bundle

## Usage

### Running commands from file

Please check the **examples** folder for more information.

Create a new `::ToyRobotSimulator::CommandInput::FileCommandInput` passing the file to the **file_name** key argument.
Optional parameters are **width** and **height** both with 5 units as default value.

```ruby
ToyRobotSimulator::CommandInput::FileCommandInput.new(file_name: 'file.txt').scan
```

Allowed commands in file:

- PLACE X,Y,F
- MOVE
- LEFT
- RIGHT
- REPORT

### Using models directly:

You can instanciate a **Robot** with a **Board** and execute the commands programatically.

```ruby
robot = ToyRobotSimulator::Robot.new(ToyRobotSimulator::Board.new)

robot.place(x: 0, y: 0, facing: 'EAST')
robot.move
robot.move
robot.left
robot.move
robot.report # Outputs: 2,1,NORTH
```

## Tests

Tests using **rspec** in spec folder. Run:

```shell
rake spec
```

