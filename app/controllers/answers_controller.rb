class AnswersController < ApplicationController

  before_action :authenticate_user!, only: [:destroy, :delete, :new, :create]

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = @question.id
    if @answer.save
      redirect_to @question, notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  def destroy

  end

  def answer_params
    params.require(:answer).permit(:description)
  end
end
