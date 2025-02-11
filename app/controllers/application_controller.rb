class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do 
    erb :new
  end
  
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params["id"])
    erb :edit_recipe
  end
  
  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params["id"])
    erb :show
  end
  
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params["id"])
    @recipe.update(name: params["name"], ingredients: params["ingredients"], cook_time: params["cook_time"])
    
    redirect to "/recipes/#{@recipe.id}"
  end
  
  post '/recipes' do
    @recipe = Recipe.create(:name => params["name"], :ingredients => params["ingredients"], :cook_time => params["cook_time"])
    redirect to "/recipes/#{@recipe.id}"
  end
  
  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params["id"])
    @recipe.destroy
    redirect to '/recipes'
  end





end
