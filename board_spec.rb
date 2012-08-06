require_relative 'board'
require_relative 'piece'
require_relative 'pawn'

describe ChessBoard do
  before :each do
    @ChessBoard = ChessBoard.new
  end

  def initializeStandardBoard
    @ChessBoard.placePiece(["Rd3", "Pe7", "Qa5"])
  end

  def initializeWhitePawnsBoard
    @ChessBoard.placePiece(["Pa3B", "Pb2W", "Pb3B", "Pc3B", "Pf2W", "Pg3W"])
  end


  it "should accept a chess notation and return a valid position" do
    @ChessBoard.notationToPosition("Be5W").should eql [5, 5]
    @ChessBoard.notationToPosition("Kb7W").should eql [2, 7]
  end

  it "should initialize a board with chess pieces and place them" do
    @ChessBoard.placePiece(["Rd3W", "Pe7W", "Qa5W"])
    @ChessBoard.getPieceAtPosition("d3").should eql "RW"
    @ChessBoard.getPieceAtPosition("e7").should eql "PW"
    @ChessBoard.getPieceAtPosition("a5").should eql "QW"
  end

  it "should not allow a white pawn to capture another white pawn" do
    initializeWhitePawnsBoard()
    @ChessBoard.isValid("f2", "g3").should eql false
  end

  it "should not allow a white pawn to move foward if there is a piece there" do
    initializeWhitePawnsBoard()
    @ChessBoard.isValid("b2", "b3").should eql false
  end

  it "should not allow a white pawn to move foward more than one space" do
    initializeWhitePawnsBoard()
    @ChessBoard.isValid("b2", "b4").should eql false
  end

  it "should allow a white pawn to capture a black piece to the left" do
    initializeWhitePawnsBoard()
    @ChessBoard.isValid("b2", "a3").should eql true
  end

  it "should allow a white pawn to capture a black piece to the right" do
    initializeWhitePawnsBoard()
    @ChessBoard.isValid("b2", "c3").should eql true
  end

  it "should allow a white pawn to move foward if the space is empty" do
    initializeWhitePawnsBoard()
    @ChessBoard.isValid("f2", "f3").should eql true
  end


  it "should determine whether the black move is valid" do
    @ChessBoard.placePiece(["Pa6W", "Pb7B", "Pb6W", "Pc6W", "Pf7B", "Pg6B"])
    @ChessBoard.isValid("b7", "b6").should eql false
    @ChessBoard.isValid("b7", "b5").should eql false
    @ChessBoard.isValid("b2", "a3").should eql true
    @ChessBoard.isValid("b2", "c3").should eql true
    @ChessBoard.isValid("f2", "f3").should eql true
    @ChessBoard.isValid("f2", "g3").should eql false
  end

  it "should take a chess notation with a piece and place that on the board and return it" do
    @ChessBoard.placePiece("Pa2W")
    @ChessBoard.getPieceAtPosition("a2").should eql "PW"
  end

  it "should create a 8x8 2D array" do
    @ChessBoard.board.length.should eql 8

    @ChessBoard.board.each do |row|
      row.length.should eql 8
    end
  end
end

=begin
describe Piece do
  before :each do
    @Pawn = Pawn.new
  end

  it "should determine whether a move is valid" do 
    Pawn.isValidMove("Pa2
  end
end
=end
