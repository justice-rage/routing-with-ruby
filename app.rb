require('sinatra')

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
  
  get('/words/:id') do
    "Word Page - MVP:
        1) This route will show a specific word based on its ID. The value of 
           ID here is #{params[:id]}
        2) Create a word definition form with an ID of #{params[:id]}:
            a. add a definition
            b. edit a deifintion
            c. delete a definition
            d. delete word option"
  end