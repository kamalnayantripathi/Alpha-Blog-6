class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit,:update, :destroy]


	def index
		@users = User.paginate(page: params[:page], per_page: 5)
	end
	
	def new
		@user = User.new
	end

	def edit
		
	end

	def show
		@articles = @user.articles.paginate(page: params[:page], per_page: 5)
	end

	def create
		if @user.save
		  session[:user_id] = @user.id
		  flash[:notice] = "You have been successfully signed up"
     	  redirect_to articles_path
		else
			render :new
		end
	end

	def update
		if @user.update(user_params)
		  flash[:notice] = "Your profile has been updated successfully"
		  redirect_to user_path
		else
		  render :edit
		end
	end

    def destroy
    	@user.destroy
    	session[:user_id] = nil if @user == current_user
        flash[:notice] = "Profile and associated articles deleted successfully"
        redirect_to users_path 
    end


	private

	def user_params
		params.require(:user).permit(:username,:email,:password)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		if current_user != @user && !current_user.admin?
			flash[:alert] = "You are not authorized to delete any other blogger's profile"
			redirect_to users_path
		end
	end

end