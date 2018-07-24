class Client::QuestionsController < ApplicationController

  def new 
    render 'new.html.erb'
  end

  def create 
    @question = {
      "tittle" => params[:tittle],
      "text" => params[:text],
      "symptoms" => params[:symptoms],
      "animal_id" => params[:animal_id],
      "user_id" => 1
    }
    response = Unirest.post("http://localhost:3000/api/questions", parameters: @question)
    puts response
    redirect_to "/client/animals/#{params[:question_id]}"
  end 

  def show 
    question_id = params[:id]
    @question = Unirest.get("http://localhost:3000/api/questions/#{question_id}").body
    render 'show.html.erb'
  end

  def edit 
    @question = Unirest.get("http://localhost:3000/api/questions/#{params[:id]}").body 
    render 'edit.html.erb'
  end 

  def update 
    @question = {
      "id" => params[:id],
      "tittle" => params[:tittle], 
      "text" => params[:text],
      "symptoms" => params[:symptoms]
    }
    response = Unirest.patch("http://localhost:3000/api/questions/#{params[:id]}", parameters: @question)
    redirect_to "/client/questions/#{params[:id]}"
  end 

  def destroy 
    response = Unirest.delete("http://localhost:3000/api/questions/#{question_id}")
    redirect_to "/client/questions"
    #find right route to redirect
  end 

  #authentication if response.code == 200
  #refer to contact app controller github

end
