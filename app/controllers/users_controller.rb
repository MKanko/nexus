class UsersController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]

    def index
        if current_user.admin
            @users = User.all
        else
            redirect_to user_path(current_user)
        end  
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
        if current_user.admin
            @user = User.find(params[:id])
        else 
            @user = User.find(current_user.id)
        end  
    end 

    def edit
        if current_user.admin 
            @user = User.find(params[:id])
        else 
            @user = User.find(current_user.id)
        end  
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end 

    def destroy
        User.find(params[:id]).destroy
        redirect_to users_path 
    end 

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :admin, :confirm_admin)
    end 

end
