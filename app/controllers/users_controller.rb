class UsersController < ApplicationController

  before_action :authenticate_user!
  # before_action :authenticate_user!, except:[:show]

	def index
		@users = User.all
   		@user = User.new
   		@books = Book.all
    	@book = Book.new
	end
	def show
		@user = User.find(params[:id])
		@books = Book.all
        @book = Book.new
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		@user.update(user_params)
  		redirect_to user_path(current_user.id)
	end

	private
	  def user_params
	  	params.require(:user).permit(:name,:image,:introduction)
	  end
end
