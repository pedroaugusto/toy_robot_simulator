module ToyRobotSimulator
  class Board
    DEFAULT_WIDTH  = 5
    DEFAULT_HEIGHT = 5

    attr_reader :current_x, :current_y

    # Instanciates a board with its dimensions. 5x5 as default
    def initialize(width: DEFAULT_WIDTH, height: DEFAULT_HEIGHT)
      @matrix = Array.new(width, Array.new(height, true))
    end

    # Returns true if the coordinates belongs to the board surface
    def valid_position?(x, y)
      x.is_a?(Integer) &&
      y.is_a?(Integer) &&
      x >= 0           &&
      y >= 0           &&
      !@matrix.dig(x, y).nil?
    end

    # Stores the robot position
    def place(x, y)
      @current_x = x
      @current_y = y
    end
  end
end