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
    
    def show
        @schedule = Schedule.find(params[:id])
    end 

    def edit
        @schedule = Schedule.find(params[:id])
    end

    def update
        @schedule = Schedule.find(params[:id])
        @schedule.update(name: params[:schedule][:name], year: params[:schedule][:year], month: params[:schedule][:month], day_date: params[:schedule][:day_date], day_name: params[:schedule][:day_name], hour: params[:schedule][:hour], half_hour: params[:schedule][:half_hour])
        redirect_to schedule_path(@schedule)
    end 

    def destroy
        Schedule.find(params[:id]).destroy
    end 

    private

    def schedule_params
        params.require(:schedule).permit(:name, :year, :month, :day_date, :day_name, :hour, :half_hour, :schedule_item)
    end 

end
