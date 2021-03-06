class SessionsController < ApplicationController

    skip_before_action :require_login, only: [:new, :create]
    
    def new
        @user = User.new  
    end 

    def create
        if auth_hash = request.env["omniauth.auth"] 
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.username = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
                u.password = auth['uid']
            end           
              session[:user_id] = @user.id          
              redirect_to user_path(@user)
        else
            @user = User.find_by(username: params[:user][:username])
            return redirect_to '/signin' unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        end 
    end 

    def destroy
        session.destroy  
        redirect_to '/'
    end
    
    private
 
    def auth
        request.env['omniauth.auth']
    end

end 