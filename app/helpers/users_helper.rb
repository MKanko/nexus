module UsersHelper

    def current_datetime
        time = Time.new
        time.strftime("%A %d %b %Y %l:%M %p")        
    end
end
