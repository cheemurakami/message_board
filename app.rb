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
  'this route will show a specific board based on its id. The value of ID here is #{params[:id]}.'
end

post ('/boards') do
  'this route will add a board to out list'
  name = params[:board_name]
  board = Board.new({:name => name, :id => nil})
  board.save
  # @boards = Board.all
  redirect to ('/boards')
end