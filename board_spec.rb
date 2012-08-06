require_relative 'board'

describe ChessBoard do
  before :each do
    @ChessBoard = ChessBoard.new
  end

  def initializeWhitePawnsBoard
    @ChessBoard.placePiece(["Pa3B", "Pb2W", "Pb3B", "Pc3B", "Pf2W", "Pg3W"])
  end

  def initializeBlackPawnsBoard
    @ChessBoard.placePiece(["Pa6W", "Pb7B", "Pb6W", "Pc6W", "Pf7B", "Pg6B"])
  end

  # Board Tests
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

  it "should create a 8x8 2D array" do
    @ChessBoard.board.length.should eql 8

    @ChessBoard.board.each do |row|
      row.length.should eql 8
    end
  end

  # White pawn placements
  it "should not allow a white pawn to capture another white pawn" do
    initializeWhitePawnsBoard()
    @ChessBoard.isValid("f2", "g3").should eql false
  end

  it "should not allow a white pawn to move backwards" do
    initializeWhitePawnsBoard()
    @ChessBoard.isValid("b2", "b1").should eql false
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

  # Black pawn placements
  it "should not allow a black pawn to capture another black pawn" do
    initializeBlackPawnsBoard()
    @ChessBoard.isValid("f7", "g6").should eql false
  end

  it "should not allow a black pawn to move backwards" do
    initializeBlackPawnsBoard()
    @ChessBoard.isValid("b7", "b8").should eql false
  end

  it "should not allow a black pawn to move foward if there is a piece there" do
    initializeBlackPawnsBoard()
    @ChessBoard.isValid("b7", "b6").should eql false
  end

  it "should not allow a black pawn to move foward more than one space" do 
    initializeBlackPawnsBoard()
    @ChessBoard.isValid("b7", "b5").should eql false
  end

  it "should allow a black pawn to capture a white piece to the left" do
    initializeBlackPawnsBoard()
    @ChessBoard.isValid("b7", "a6").should eql true
  end

  it "should allow a black pawn to capture a white piece to the right" do
    initializeBlackPawnsBoard()
    @ChessBoard.isValid("b7", "c6").should eql true
  end

  it "should allow a black pawn to move foward if the space is empty" do 
    initializeBlackPawnsBoard()
    @ChessBoard.isValid("f7", "f6").should eql true
  end

  it "should take a chess notation with a piece and place that on the board and return it" do
    @ChessBoard.placePiece("Pa2W")
    @ChessBoard.getPieceAtPosition("a2").should eql "PW"
  end

  # Movement
  it "should update the board to have a white pawn capture a black pawn" do
    initializeWhitePawnsBoard()
    @ChessBoard.move("b2", "a3").should eql true
    @ChessBoard.getPieceAtPosition("b2").should eql nil
    @ChessBoard.getPieceAtPosition("a3").should eql "PW"
  end

  it "should update the board to have a black pawn capture a white pawn" do
    initializeBlackPawnsBoard()
    @ChessBoard.move("b7", "a6").should eql true
    @ChessBoard.getPieceAtPosition("b7").should eql nil
    @ChessBoard.getPieceAtPosition("a6").should eql "PB"
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
