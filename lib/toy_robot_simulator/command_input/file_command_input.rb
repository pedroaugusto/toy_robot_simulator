module ToyRobotSimulator
  module CommandInput
    class FileCommandInput

      PLACE_MATCHER = /^PLACE\s*([0-9]*),\s*([0-9]*)\s*,\s*(NORTH|SOUTH|EAST|WEST)\s*$/.freeze
      PARAMETERLESS_COMMANDS = %w(MOVE REPORT LEFT RIGHT).freeze

      def initialize(file_name:,
        width:  ::ToyRobotSimulator::Board::DEFAULT_WIDTH,
        height: ::ToyRobotSimulator::Board::DEFAULT_HEIGHT )

        board =  ::ToyRobotSimulator::Board.new(width: width, height: height)
        @robot = ::ToyRobotSimulator::Robot.new(board)
        @file_name = file_name
      end

      # Read and run the commands from given file
      def scan
        File.open(@file_name, 'r') do |content|
          while (line = content.gets)
            run_command(line)
          end
        end
      end

      # try to run a text command
      def run_command(command)

        # Remove trailing spaces and new lines
        command = command.strip.chomp

        if ( matches = command.match(PLACE_MATCHER) )
          @robot.place({
            x: matches[1].to_i,
            y: matches[2].to_i,
            facing: matches[3]
          })
        elsif PARAMETERLESS_COMMANDS.include?(command)
          @robot.send(command.downcase.to_sym)
        else
          puts "Invalid command: #{command}"
        end
      end
    end
  end
end