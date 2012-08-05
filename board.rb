class ChessBoard
  attr :board

  def initialize()
    @board = Array.new
    for i in 0..7
      @board[i] = ['', '', '', '', '', '', '', '']
    end
  end

  def notationToPosition(notation)
    positions = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h' ]

    if notation.length == 2
      horizontal = positions.index(notation[0])
      vertical = notation[1]
    elsif notation.length == 3
      horizontal = positions.index(notation[1])
      vertical = notation[2]
    else
      return nil
    end

    horizontal += 1
    [horizontal, vertical.to_i]
  end

  def placePiece(piece)
    if piece.kind_of? Array
      piece.each do |p|
        placePiece(p)
      end

      return
    end

    position = notationToPosition(piece)
    @board[position[0]][position[1]] = piece[0]
  end

  def getPieceAtPosition(position)
    position = notationToPosition(position)
    return @board[position[0]][position[1]]
  end
end
