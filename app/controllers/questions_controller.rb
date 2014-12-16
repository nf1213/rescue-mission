class QuestionsController < ApplicationController

  def current_user_id
    1
  end

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    id = params[:id]
    @question = Question.find(id)
  end

  def edit

  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user_id
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end

  def new
    @question = Question.new
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
