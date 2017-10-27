# Q0: Why is this error being thrown?
The model Pokemon does not exist.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *
Pikachu, Squirtle, Charmander, Bulbasaur.
They are not owned by the signed in trainer.

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.
It creates a button with the tag "Throw a Pokeball!", which calls the capture method in the PokemonsController with the parameter id: @pokemon found from the home#index method (the pokemon which is not owned by the current trainer). capture_path is created by default the path to the function in Ruby's convention. :class => "buttom medium" is to specify the size of the button, and :method => :patch means that upon the click of botton, we make an update request through the PATCH method, which we route it to PokemonController's capture method.

# Question 3: What would you name your own Pokemon?
I would name it whatever it is called.

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?
I pass in trainer_path to redirect_to, with a parameter of the trainer id. If it is not a path here, trainer_path is just an alias of "trainer#show", we can redirect to there by explicitly stating: redirect_to controller: 'trainers', action: 'show', id: current_trainer.id.


# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.
flash is the alert that shows on the top of the webpage, it has an attribute :error to store the error message to be printed as a flash message. As we initialize a Pokemon record (@pokemon here) with the validated parameters, if the parameters failed the validation, an errors attribute is initialized under @pokemon. @pokemon.errors.full_messages return all the full error messages as there could be multiple errors detected at the same time. to_sentence will turn the array of mutiple error messages as a comma-separated sentence and the last element is joined by "and". At the end, the message is rendered through the layout defined by application.html.erb
Specifically:        
<%= render 'layouts/messages' %>
<%= yield %>


# Give us feedback on the project and decal below!
The project is a pretty good wrap up of the course material so far. Overall,the difficulty and amount of content is manageable in this decal class. Thank you for all the hard work the staff team has put in! :)

# Extra credit: Link your Heroku deployed app
