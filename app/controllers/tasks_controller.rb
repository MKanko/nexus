class TasksController < ApplicationController

    def index 
        @tasks = Task.all 
    end 

    def new 
        @task = Task.new(schedule_id: params[:schedule_id])
    end 

    def create 
        # binding.pry
        @task = Task.new(task_params) 
        #binding.pry
        return render :new unless @task.save
        redirect_to task_path(@task)
    end 

    def show
        @task = Task.find(params[:id])
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        redirect_to task_path(@task)
    end 

    def destroy
        @task = Task.find(params[:id]).destroy
        redirect_to user_path(current_user) 
    end 

    private

    def task_params
        params.require(:task).permit(:name, :task_type, :status, :end_time, :notes, :start_time, :schedule_id, :company_id)
    end 
        
end
