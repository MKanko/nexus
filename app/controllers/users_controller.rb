class UsersController < ApplicationController

    def new 
        @user = User.new 
    end 

    def create
        @user = User.new(user_params)

        return redirect_to new_user_path unless @user.save 
        session[:user_id] = @user.user_id

        redirect_to user_path(@user)
    end
    
    def show
        if !logged_in?
            redirect_to '/'
        else
            @user = User.find(params[:id])
        end
    end 
    
end
