class UsersController < ApplicationController
	def new
		if current_user
			redirect_to "show"
		end
		@user = User.new
	end

	def index
		@users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users}
    end
	end

	def create
		@user = User.new(user_create_params)
		if @user.save
			session[:user_id] = @user.id
			render "show", :notice => "Signed Up!"
		else
			render "new"
		end
	end

	def show
		@user = User.find(user_id_params[:id])
		@archives = @user.archives
	end

	def delete
	end

	def update
	end

	private

	def user_create_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

	def user_id_params
		params.permit(:id)
	end
end
