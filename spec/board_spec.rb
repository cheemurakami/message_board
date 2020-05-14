require "rspec"
require "pry"
require "board"

describe ("#Board") do
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

  

end
