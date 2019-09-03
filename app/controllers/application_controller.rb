class ApplicationController < ActionController::Base

    before_action :require_login

    helper_method :current_user, :logged_in?  

    def current_user
        if session[:user_id]
            @current_user = User.find_by_id(session[:user_id])
        end 
    end 

    def logged_in?
        !!current_user 
    end
    
    private
 
    def require_login
        unless logged_in?
        flash[:error] = "You must first sign in!"
        redirect_to '/' # halts request cycle
        end
    end

end

