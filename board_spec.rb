require_relative 'board'

describe ChessBoard do
  before :each do
    @ChessBoard = ChessBoard.new
  end

  it "should accept a chess notation and return a valid position" do
    @ChessBoard.notationToPosition("Be5").should eql [5, 5]
    @ChessBoard.notationToPosition("b7").should eql [2, 7]
    @ChessBoard.notationToPosition("b7ee").should eql nil
  end

  it "should accept an array of chess notations and place those on the board" do
    @ChessBoard.placePiece(["Ka2", "Bb3", "Pc4"])
    @ChessBoard.getPieceAtPosition("a2").should eql "K"
    @ChessBoard.getPieceAtPosition("b3").should eql "B"
    @ChessBoard.getPieceAtPosition("c4").should eql "P"
  end

  it "should take a chess notation with a piece and place that on the board and return it" do
    @ChessBoard.placePiece("Pa2")
    @ChessBoard.getPieceAtPosition("a2").should eql "P"
  end

  it "should create a 8x8 2D array" do
    @ChessBoard.board.length.should eql 8

    @ChessBoard.board.each do |row|
      row.length.should eql 8
    end
  end
end
