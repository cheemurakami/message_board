class Board 
  attr_reader(:name, :id)

  @@boards = {}
  @@total_rows = 0

 def initialize (attributes)
  @name = attributes.fetch(:name)
  @id = attributes.fetch(:id) || @@total_rows += 1
 end

end