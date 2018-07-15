class Client::QuestionsController < ApplicationController

  # def index 
  #   # question_params = {
  #   #   search: params[:search]
  #   # }

  #   @questions = Unirest.get("http://localhost:3000/api/questions").body
  #   render 'index.html.erb'
  # end 

  def new 
    @question = {
      "tittle" => params[:title],
      "text" => params[:text],
      "symptoms" => params[:symptoms]
    }
    render 'new.html.erb'
  end

  def create 
    @question = {
      "tittle" => params[:tittle],
      "text" => params[:text],
      "symptoms" => params[:symptoms]
    }
    response = Unirest.post("http://localhost:3000/api/questions", parameters: @question)
    redirect_to "/client/questions"
    #HOw can I redirect to the question that was just created?
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
    redirect_to "/client/animals"
    #find right route to redirect
  end 

  #authentication if response.code == 200
  #refer to contact app controller github

end
