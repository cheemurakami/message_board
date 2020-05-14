require('sinatra')
require('sinatra/reloader')
require('./lib/board')
require('pry')
also_reload('lib/**/*.rb')

get('/') do #home
  @boards = Board.all
  erb(:boards)
end
get ('/boards') do 
  @boards = Board.all
  erb(:boards)
end

get ('/boards/new') do
  erb(:new_board)
end

get ('/boards/:id') do
  @board = Board.find(params[:id].to_i) #by clicking li tag which has id
  @boards = Board.all
  erb(:board)
end

post ('/boards') do
  name = params[:board_name]
  board = Board.new({:name => name, :id => nil})
  board.save
  # @boards = Board.all
  redirect to ('/boards')
end

patch('/boards/:id') do
  @board = Board.find(params[:id].to_i)
  @board.update(params[:])
  erb(:boards)
end


delete('/boards/:id') do
  board = Board.find(params[:id].to_i)
  board.delete
  redirect to ('boards')
end