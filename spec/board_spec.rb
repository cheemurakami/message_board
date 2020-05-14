require "rspec"
require "pry"
require "board"

describe ("#Board") do

  before(:each) do
    Board.clear()
  end

  describe ("initialize") do
    it("creates a new board with a name") do
      board1 = Board.new({:name => "kiwi", :id => nil})
      expect(board1.id).to eq(1)
      expect(board1.name).to eq("kiwi")
    end
  end

  describe(".all")do
    it("returns an empty array when there are no boards")do
      expect(Board.all).to eq([])
    end
  end

  describe("#save") do 
    it("saves a board") do 
      board1 = Board.new({:name => "kiwi", :id => nil})
      board1.save()
      board2 = Board.new({:name => "apple", :id => nil})
      board2.save()
      expect(Board.all).to(eq([board1, board2]))
    end
  end

  describe(".clear") do
    it ("cleans all boards") do
    board1 = Board.new({:name => "kiwi", :id => nil})
    board1.save()
    Board.clear
    expect(Board.all).to eq([])
    end
  end

  describe(".find") do
    it("finds a board by id")do
    board1 = Board.new({:name => "kiwi", :id => nil})
    board1.save()
    expect(Board.find(board1.id)).to eq(board1)
    end
  end

  describe("#update") do
    it ("update a board by id")do
    board1 = Board.new({:name => "kiwi", :id => nil})
    board1.update("apple")
    board1.save
    board2 = Board.new({:name => "chee", :id => nil})
    board2.save()
    expect(board1.name).to eq("apple")
    expect(Board.all).to eq([board1, board2])
    end
  end

  describe("#delete") do
    it ("deletes a board by id")do
    board1 = Board.new({:name => "kiwi", :id => nil})
    board1.save()
    board2 = Board.new({:name => "chee", :id => nil})
    board2.save()
    board1.delete
    expect(Board.all).to eq([board2])
    end
  end

end
