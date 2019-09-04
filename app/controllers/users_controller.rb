class UsersController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]

    def index
        # if admin && if admin_logged_in?
        @users = User.all 
    end 

    def new 
        @user = User.new 
    end 

    def create
        @user = User.new(user_params)
        return render :new unless @user.save 
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
    
    def show
        @user = User.find(params[:id])         
    end 

    def edit
        @user = User.find(params[:id]) 
    end

    def update
        @user = User.find(params[:id])
        @user.update(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password]) 
        redirect_to user_path(@user)
    end 

    def destroy
        # if admin && if admin_logged_in?
        User.find(params[:id]).destroy
        redirect_to users_path 
    end 

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

end
