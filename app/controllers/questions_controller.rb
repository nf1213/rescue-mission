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
    @question = Question.find(params[:id])
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
    @question = Question.find(params[:id])
    @question.update(question_params)
    if @question.save
      redirect_to @question, notice: 'Question was updated.'
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: "Question deleted"
  end

  def new
    @question = Question.new
  end

  def question_params
    params.require(:question).permit(:title, :description)
  end
end
