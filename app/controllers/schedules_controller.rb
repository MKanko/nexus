class SchedulesController < ApplicationController

    def index
        @schedules = Schedule.all 
    end 

    def new
        @schedule = Schedule.new 
    end 

    def create
        @schedule = Schedule.new(schedule_params)
        return redirect_to new_schedule_path unless @schedule.save
        redirect_to schedule_path(@schedule)
    end 
end
