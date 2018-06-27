require './config/environment'

class ApplicationController < Sinatra::Base
  # register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#INDEX---------------------------------------------
    get '/recipes' do
      @recipes = Recipe.all
      erb :index
    end

#NEW----------------------------------------------
  get '/recipes/new' do
    erb :new
  end

#CREATE-------------------------------------------
    post '/recipes' do
      @recipe = Recipe.create(params)
      redirect "/recipes/#{ @recipe.id }"
    end

#SHOW----------------------------------------------
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

#EDIT----------------------------------------------
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

#PATCH/UPDATE---------------------------------------------
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    recipe.update(params)
    redirect "/recipes/#{ @recipe.id }"
  end


#DELETE-------------------------------------------
  delete '/recipes/:id/delete' do
  @recipe = Recipe.find(params[:id])
  @recipe.delete
  redirect '/recipes'
end

end


#


# In the application_controller.rb, set up a controller action that will render a form to create a new recipe. This controller action should create and save this new recipe to the database.
#
# Again in the application_controller.rb, create a controller action that uses RESTful routes to display a single recipe.
#
# Create a third controller action that uses RESTful routes and renders a form to edit a single recipe. This controller action should update the entry in the database with the changes, and then redirect to the recipe show page
#
# Create a controller action (index action) that displays all the recipes in the database.
#
# Add to the recipe show page a form that allows a user to delete a recipe. This form should submit to a controller action that deletes the entry from the database and redirects to the index page.
