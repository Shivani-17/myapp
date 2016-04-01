class UsersController < ApplicationController
  def new
  end
def create
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :role, :username, :email)
  end
end
end
