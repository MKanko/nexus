class SessionsController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]
    
    def new
        @user = User.new  
    end 

    def create
        @user = User.find_by(username: params[:user][:username])
        return redirect_to '/signin' unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
    end 

    def destroy
        session.destroy  
        redirect_to '/'
    end 

end 