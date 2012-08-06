class ChessBoard
  attr :board

  def initialize()
    @board = Array.new
    for i in 0..7
      @board[i] = [nil, nil, nil, nil, nil, nil, nil, nil]
    end
  end

  def isValid(from, to)
    pieceFrom = getPieceAtPosition(from)
    positionFrom = notationToPosition(from)

    pieceTo = getPieceAtPosition(to)
    positionTo = notationToPosition(to)

    if (pieceFrom.nil?) 
      return false
    end

    #if its a pawn
    if (pieceFrom[0] == "P")
      #if its a white piece
      if pieceFrom[1] == "W"
        # Make sure we're advancing to the next row
        if ((positionFrom[1]+1) != positionTo[1])
          return false
        # If we're capturing a piece
        elsif ((positionFrom[0]-1) == positionTo[0]) || ((positionFrom[0]+1) == positionTo[0])
          # Make sure there's a piece there
          if (pieceTo.nil?)
           return false
          # Make sure its an opposite color
          elsif pieceTo[1] != "B"
            return false
          else
            return true
          end 
        # We're advancing to next row, make sure it's clear
        elsif pieceTo.nil?
          return true
        else
          return false
        end
          
      #if its a black piece
      elsif pieceFrom[1] == "B"
        # Make sure we're advancing to the next row
        if ((positionFrom[1]-1) != positionTo[1])
          return false
        # If we're capturing a piece
        elsif ((positionFrom[0]-1) == positionTo[0]) || ((positionFrom[0]+1) == positionTo[0])
          # Make sure there's a piece there
          if (pieceTo.nil?)
           return false
          # Make sure its an opposite color
          elsif pieceTo[1] != "W"
            return false
          else
            return true
          end 
        # We're advancing to next row, make sure it's clear
        elsif pieceTo.nil?
          return true
        else
          return false
        end
      end
    else
      return false
    end
  end

  def move(from, to)
    if !isValid(from, to)
      return false
    end

    pieceFrom = getPieceAtPosition(from)
    positionFrom = notationToPosition(from)

    pieceTo = getPieceAtPosition(to)
    positionTo = notationToPosition(to)

    @board[positionTo[0]][positionTo[1]] = pieceFrom
    @board[positionFrom[0]][positionFrom[1]] = nil

    return true
  end

  def notationToPosition(notation)
    positions = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h' ]

    if notation.length == 2
      horizontal = positions.index(notation[0])
      vertical = notation[1]
    elsif notation.length == 4
      horizontal = positions.index(notation[1])
      vertical = notation[2]
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
    @board[position[0]][position[1]] = piece[0] + piece[3]
  end

  def getPieceAtPosition(position)
    position = notationToPosition(position)
    return @board[position[0]][position[1]]
  end
end
