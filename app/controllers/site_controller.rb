class SiteController < ApplicationController

    skip_before_action :require_login, only: [:home]

    def home
        if !logged_in?
            render :layout => false
        else
            redirect_to user_path(current_user)
        end  
    end 
end 