class UsersController < ApplicationController
before_filter :signed_in_user, only: [:index,:edit, :update]
before_filter :correct_user, only: [:edit, :update, :index]
before_filter :admin_user, only: :destroy
  def index
    @users = User.paginate(page: params[:page])
@user = User.find(params[:id])
@microposts = @user.microposts.paginate(page: params[:page])
  
  end

  def new
   @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
def destroy
User.find(params[:id]).destroy
flash[:success] = "User destroyed."
redirect_to users_path
end
 def update
@user = User.find(params[:id])  
if params[:user].present? && @user.update_attributes(params.require(:user).permit(:name,:password, :password_confirmation))
flash[:success] = "Profile updated"
sign_in @user
redirect_to @user
else
render 'edit'
end

end


 def edit
@user = User.find(params[:id])  
if params[:user].present? && @user.update_attributes(params.require(:user).permit(:name,:password, :password_confirmation))
flash[:success] = "Profile updated"
sign_in @user
redirect_to @user
else
render 'edit'
end
end

  

def create
  @user=  User.create(user_params)
if @user.save
sign_in @user
flash[:success] = "Welcome to the Sample App!"
redirect_to @user
else
render 'new'
end
  end


  private
  def user_params
params.require(:user).permit(:password, :password_confirmation, :email,:name)
  end 
private
def signed_in_user
unless signed_in?
store_location
redirect_to signin_path, notice: "Please sign in." 
end
end
def correct_user
@user = User.find(params[:id])
redirect_to(root_path) unless current_user?(@user)
end
end  






