module SchedulesHelper

    def current_week
            time = Time.new
            time.strftime("%W")
    end 
    
    def sort_tasks
        @schedule.tasks.sort_by do |task|
            task.date 
        end 
    end
end
