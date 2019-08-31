class UsersController < ApplicationController

    def index
        @users = User.all 
    end 

    def new 
        @user = User.new 
    end 

    def create
        @user = User.new(user_params)

        return redirect_to new_user_path unless @user.save 
        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end
    
    def show
        if !logged_in?
            redirect_to '/'
        else
            @user = User.find(params[:id])
        end
    end 

    def edit
        @user = User.find(params[:id]) 
    end

    def update
        @user = User.find(params[:id])
        @user.update(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password]) 
        redirect_to user_path(@user)
    end 

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

end
