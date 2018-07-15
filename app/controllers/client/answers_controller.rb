class Client::AnswersController < ApplicationController

  def create
    answer_params = {
      text: params[:text],
      question_id: params[:question_id]
    } 
    @answer = Unirest.post

    render 
  end 
end
