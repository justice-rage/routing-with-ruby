require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')

get('/') do
    "Home Page - MVP:
        1) Create button that routes to /new-word-form
        2) List all /new-word-form created words on home page
        3) Each listed word is a link routing to /words/:id"
  end
  
  get('/new-word-form') do
    "New Word Form - MVP: 
        Form Structure:
            1) User text input field - write a word
            2) Submit button - add word to be displayed 
               with editable definition or definitions"
  end

  post('/words') do
    "Word List - MVP:
    1) This route will add a word to our list of words on our home page.
        a. Unaccesible by typing in the url
        b. Will use /new-word-form specifying a POST action to reach this route."
  end
  
  get('/words/:id') do
    "Word Page - MVP:
        1) This route will take a user to a word specific page based on its ID. 
        The value of ID here is #{params[:id]}
        2) Create a word definition form with an ID of #{params[:id]}:
            a. add a definition - get(/words/:id)
                · Unsure of route path for adding sole definitions
            b. update/edit a deifintion - patch(/words/:id)
            c. delete a definition - delete(/words/:id)
  end