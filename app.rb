require('sinatra')
require('sinatra/reloader')
require('./lib/board')
require('pry')
also_reload('lib/**/*.rb')

get('/') do 
  erb(:boards)
end