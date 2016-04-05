class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
   @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
<<<<<<< HEAD
def create
    User.create(user_params)
  end
=======
>>>>>>> sign-up

  private

  def user_params
<<<<<<< HEAD
    params.require(:user).permit(:password, :password_confirmation, :role, :name, :email)
  end
end
end
=======
    params.require(:user).permit(:password, :password_confirmation, :email,:name)
  end 
end  





>>>>>>> sign-up
