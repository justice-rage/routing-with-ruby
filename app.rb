require('sinatra')
require('sinatra/reloader')
require('./lib/word')
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
  
  get('/words/new-word-form') do
    "New Word Form - MVP: 
        Form Structure:
            1) User text input field - write a word
            2) Submit button - add word to be displayed 
               with editable definition or definitions"

    erb(:new_word)
  end

  post('/words') do
    name = params[:word_name]
    word = Word.new(name, nil)
    word.save()
    @words = Word.all()
    erb(:words)
  end
  
  get('/words/:id') do
    @word = Word.find(params[:id].to_i())
    erb(:word)
  end

  get('/words/:id/edit') do
    @word = Word.find(params[:id].to_i())
    erb(:edit_word)
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
  

  get('/test') do
    @something = "a variable"
    erb(:whatever)
  end