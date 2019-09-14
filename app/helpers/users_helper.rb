module UsersHelper

    def current_datetime
        time = Time.new
        time.strftime("%a %m %e %Y")
         
    end
end
