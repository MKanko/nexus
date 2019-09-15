module UsersHelper

    def current_datetime
        time = Time.new
        time.strftime("%A %d %b %Y %l:%M %p")        
    end

    def current_date
        time = Time.new
        time.strftime("%A %d %b %Y")
    end 
    
    def sort_user_tasks
        @user.tasks.sort_by do |task|
            task.date 
        end 
    end

end
