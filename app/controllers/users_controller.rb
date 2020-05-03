class UsersController < ApplicationController
  def show
    @name = current_user.name
    @questions = current_user.questions
  end
end
