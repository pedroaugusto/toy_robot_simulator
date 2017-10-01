module ToyRobotSimulator

  class Robot
    DIRECTIONS = %w(NORTH EAST SOUTH WEST)

    # Istanciates a robot with the board wich it will move on
    def initialize(board)
      @board = board
    end

    # Place the robot in the specified coordinates and facing
    def place(x:, y:, facing: 'NORTH')
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

    # Moves robot one unit in the board according to current facing
    # only if next step keeps the robot in the board.
    def move
      if placed?
        new_x, new_y = next_move_coordinates

        if @board.valid_position?(new_x, new_y)
          @board.place(new_x, new_y)
        end
      end
    end

    private

      def placed?
        @board.current_x && @board.current_y && @facing
      end

      def valid_facing?(facing)
        DIRECTIONS.include?(facing)
      end

      # Return the coordinates if a move command occurred
      # ignoring if it is valid or not.
      def next_move_coordinates
        x = @board.current_x
        y = @board.current_y

        case @facing
        when 'NORTH'
          y += 1
        when 'EAST'
          x += 1
        when 'SOUTH'
          y -= 1
        when 'WEST'
          x -= 1
        end

        return [x,y]
      end

  end

end