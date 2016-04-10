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

def create
    User.create(user_params)
if @user.save
sign_in @user
flash[:success] = "Welcome to the Sample App!"
redirect to @user
else
render 'new'
end
  end


  private

  def user_params

 
  

    params.require(:user).permit(:password, :password_confirmation, :email,:name)
  end 
end  






