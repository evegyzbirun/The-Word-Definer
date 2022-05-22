require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
require('./lib/Definition')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end