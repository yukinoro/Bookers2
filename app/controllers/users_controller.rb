class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]
	before_action :authenticate_user!
	def index
		@book = Book.new
		@users = User.all
		@user = User.find(current_user.id)
	end
	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books
	end


	 
	def edit
		@user = User.find(current_user.id)
	end
	def update
		@user = User.find(params[:id])
        if @user.update(user_params)
        redirect_to user_path(@user.id) , notice: "User was successfully updated"
        else
    	render :edit , notice: "error"
       end
    end
private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def correct_user
  	user = User.find(params[:id])
  	if user != current_user
  		redirect_to new_user_session_path
  	end
  end


end
