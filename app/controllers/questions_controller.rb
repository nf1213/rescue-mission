class QuestionsController < ApplicationController

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
    @question = Question.new(title: params[:question][:title], description: params[:question][:description], user_id: 1)
    if @question.save
      redirect_to @question, notice: 'Issue was successfully created.'
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

  end
end
