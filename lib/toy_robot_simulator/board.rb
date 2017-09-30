module ToyRobotSimulator
  class Board
    DEFAULT_WIDTH  = 5
    DEFAULT_HEIGHT = 5

    # Instanciates a board with its dimensions. 5x5 as default
    def initialize(width: DEFAULT_WIDTH, height: DEFAULT_HEIGHT)
      @matrix = Array.new(width, Array.new(height, true))
    end

  end
end