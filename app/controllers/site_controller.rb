class SiteController < ApplicationController

    skip_before_action :require_login, only: [:home]

    def home
        render :layout => false 
    end 
end 