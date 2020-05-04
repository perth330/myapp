class QuestionsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @questions = Question.includes(:user)
  end

  def new
    @question = Question.new
  end

  def create
    Question.create(question_params)
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
  end

  def edit
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
  end

  def show
  end

  private
  def question_params
    params.require(:question).permit(:text).merge(user_id: current_user.id)
  end

  def set_tweet
    @question = Question.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
