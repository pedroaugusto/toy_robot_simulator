module ToyRobotSimulator

  class Robot
    DIRECTIONS = %w(NORTH EAST SOUTH WEST)

    # Istanciates a robot with the board wich it will move on
    def initialize(board)
      @board = board
    end

    # Place the robot in the specified coordinates and facing
    def place(x:, y:, facing:)
      if @board.valid_position?(x,y) && valid_facing?(facing)
        @board.place(x,y)
        @facing = facing
      else
        puts "Bad position. robot not placed."
      end
    end

    # Prints the current position and facing of the robot.
    def report
      if placed?
        puts "#{@board.current_x},#{@board.current_y},#{@facing}"
      else
        puts "Robot not placed yet."
      end
    end

    private

      def placed?
        @board.current_x && @board.current_y && @facing
      end

      def valid_facing?(facing)
        DIRECTIONS.include?(facing)
      end

  end

end