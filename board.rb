class Board
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
end
