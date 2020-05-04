class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @questions = current_user.questions
  end
end
