module UsersHelper

    def current_datetime
        time = Time.new
        time.strftime("%A %b %d %Y %l:%M %p")        
    end

    def current_date
        time = Time.new
        time.strftime("%A %b %d %Y")
    end 
    
    def sort_user_tasks(user)
        user.tasks.sort_by do |task|
            task.start_time 
        end 
    end

end
