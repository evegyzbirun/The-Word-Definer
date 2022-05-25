require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end
get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end
get('/words/new') do
  erb(:add_new_word)
end
get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  
  erb(:word)
end


post('/words') do
  name = params[:word_name]
  word = Word.new(name, nil)
  word.save()
  @words = Word.all()
  erb(:words)
end
patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:name])
  @words = Word.all
  erb(:words)
end
delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  @words = Word.all
  erb(:words)
end

get('/words/:id/definitions/definition_id') do
  @defin = Definition.find(params[:definition_id].to_i())
  erb(:definition)
end
post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  defin = Definition.new(params[:defin_name], @word.id, nil)
  defin.save()
  erb(:word)
end
patch('/words/:id/definitions/:definition_id') do
  @word = Word.find(params[:id].to_i())
  defin = Definition.find(params[:definition_id].to_i())
  defin.update(params[:name], @word.id)
  erb(:word)
end
delete('/words/:id/definitions/:definition_id') do
  defin = Definition.find(params[:definition_id].to_i())
  defin.delete()
  @word = Word.find(params[:id].to_i())
  erb(:word)
end
