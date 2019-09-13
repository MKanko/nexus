class SchedulesController < ApplicationController

    def index
        @schedules = Schedule.all 
    end 

    def new
        @schedule = Schedule.new 
    end 

    def create
        
        @schedule = Schedule.new(schedule_params)
        #binding.pry
        return render :new unless @schedule.save
        #binding.pry
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
        @schedule.update(schedule_params)
        redirect_to schedule_path(@schedule)
    end 

    def destroy
        Schedule.find(params[:id]).destroy
    end 

    private

    def schedule_params
        params.require(:schedule).permit(:name, :schedule_type)
    end 

end
