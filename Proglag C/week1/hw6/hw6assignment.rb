# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
    # The constant All_My_Pieces should be declared here
    All_My_Pieces = [
              [[[0, 0], [1, 0], [0, 1], [1, 1]]],  # square (only needs one)
               rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]), # T
               [[[0, 0], [-1, 0], [1, 0], [2, 0]], # long (only needs two)
               [[0, 0], [0, -1], [0, 1], [0, 2]]],
               rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), # L
               rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]), # inverted L
               rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]), # S
               rotations([[0, 0], [1, 0], [0, -1], [-1, -1]]), # Z
               rotations([[0, 0], [1, 0], [0, -1], [-1, -1], [-1, 0]]), # 5-sq
              [[[0, 0], [-1, 0], [1, 0], [-2, 0], [2, 0]], # 5-long (only needs two)
              [[0, 0], [0, -1], [0, 1], [0, -2], [0, 2]]],
              rotations([[0, 0], [0, 1], [1, 1]]) # 3-L
    ]
  
    # your enhancements here
    def self.next_piece (board)
      MyPiece.new(All_My_Pieces.sample, board)
    end
  
  end
  
  class MyBoard < Board
    # your enhancements here
  def initialize(game)
      super(game)
      @current_block = MyPiece.next_piece(self)
      @cheated = false

  end

    
    #create another method to rotate the falling piece 180 degrees
  def rotate_180_degrees
      if !game_over? && @game.is_running?
        @current_block.move(0, 0, 2) #rotate twice for a 180 degrees rotation
      end
      draw
  end

  # Cheats
  def cheat
    if @score >= 100 and not @cheated
      @cheated = true
      @score -= 100
    end
  end

  # gets the next piece
  def next_piece
    if @cheated
      @current_block = MyPiece.new([[[0, 0]]], self) #abnormal block <-- single block
      @cheated = false #turn to normal state of false
    else
      @current_block = MyPiece.next_piece(self) #normal block
    end
    @current_pos = nil
  end

  # gets the information from the current piece about where it is and uses this
  # to store the piece on the board itself.  Then calls remove_filled.
  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    (0..locations.size-1).each{|index| 
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end


end

  
  class MyTetris < Tetris
    # your enhancements here
    def set_board
      @canvas = TetrisCanvas.new
      @board = MyBoard.new(self)
      @canvas.place(@board.block_size * @board.num_rows + 3,
                    @board.block_size * @board.num_columns + 6, 24, 80)
      @board.draw
    end

    
    # override the key_bindings method & add new key bindings
    def key_bindings
      super # call the key_bindings method of the parent class
      #press 'u' key to make piece that is falling rotate 180 degrees
      @root.bind('u', proc {@board.rotate_180_degrees})

      #press 'c' key to cheat: 
      #if score is less than 100, nothing happens
      #else the player loses 100 points
      #a next piece will be a single square

      @root.bind('c', proc {@board.cheat})

    end


  
  end
  
  