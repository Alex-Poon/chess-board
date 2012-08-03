require_relative 'board'

describe Board do
  before :each do
    @board = Board.new
  end

  it "should accept a chess notation and return a valid position" do
    @board.notationToPosition("Be5").should eql [5, 5]
    @board.notationToPosition("b7").should eql [2, 7]
    @board.notationToPosition("b7ee").should eql nil
  end

  it "should accept an array of chess notations and place those internally on the board" do
  end

  it "should take a chess notation and return the piece at that position" do
  end
end
