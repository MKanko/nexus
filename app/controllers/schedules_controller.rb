class SchedulesController < ApplicationController

    def index
        @schedules = current_user.schedules 
    end 

    def new
        @schedule = Schedule.new 
    end 

    def create
        @schedule = Schedule.new(schedule_params)
        return render :new unless @schedule.save
        redirect_to schedule_path(@schedule)
    end

    def switch_cal_view 
        @schedule = Schedule.find(params[:schedule][:id])
        @schedule.update(schedule_params)
        redirect_to user_path(current_user)
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
        redirect_to user_path(current_user)
    end 

    private

    def schedule_params
        params.require(:schedule).permit(:name, :schedule_type, :user_id)
    end 

end
