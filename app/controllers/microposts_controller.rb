class MicropostsController < ApplicationController
before_filter :signed_in_user

def create
micropost_params=params.require(:micropost).permit(:content)
@micropost = current_user.microposts.build(micropost_params)

if @micropost.save
flash[:success] = "Micropost created!"
redirect_to root_path
else

render 'static_pages/home'
end
end
 
def destroy
@micropost = current_user.microposts.find_by_id(params[:id])
@micropost.destroy
redirect_back_or root_path
end
private
def correct_user
@micropost = current_user.microposts.find_by_id(params[:id])
redirect_to root_path if @micropost.nil?
end
end
