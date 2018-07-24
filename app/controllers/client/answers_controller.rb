class Client::AnswersController < ApplicationController

  def create 
    @answer = {
      "text" => params[:text],
      ""
    }
    response = Unirest.post("http://localhost:3000/api/answers", parameters: @answer)
    render "/client/questions/#{params[:question_id]}"
    #HOw can I redirect to the question that was just created?
  end 

  def edit 
    @answer = Unirest.get("http://localhost:3000/api/answers/#{params[:id]}").body 
    render 'edit.html.erb'
  end 

  def update 
    @question = {
      "id" => params[:id],
      "text" => params[:text]
    }
    response = Unirest.patch("http://localhost:3000/api/answers/#{params[:id]}", parameters: @answer)
    redirect_to "/client/questions/#{params[:id]}"
  end 

  def destroy 
    response = Unirest.delete("http://localhost:3000/api/answers/#{answer_id}")
    redirect_to "/client/animals"
  end

end 


  