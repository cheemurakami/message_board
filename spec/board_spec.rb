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
end
