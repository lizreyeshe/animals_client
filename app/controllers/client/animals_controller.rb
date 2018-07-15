class Client::AnimalsController < ApplicationController

  def index 
    # animal_params = {
    #   search: params[:search]
    # }

    @animals = Unirest.get("http://localhost:3000/api/animals").body 
    render "index.html.erb"
  end 

  def show 
    animal_id = params[:id]
    @animal = Unirest.get("http://localhost:3000/api/animals/#{animal_id}").body 
    render 'show.html.erb'
  end 
end
