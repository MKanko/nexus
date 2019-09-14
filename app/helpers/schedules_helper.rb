module SchedulesHelper

    def current_week
            time = Time.new
            time.strftime("%W")
        end  
end
