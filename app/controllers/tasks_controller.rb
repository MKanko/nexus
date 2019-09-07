class TasksController < ApplicationController

    def index 
        @tasks = Task.all 
    end 

    def new 
        @task = Task.new
    end 

    def create 
        @task = Task.new(task_params)
        return redirect_to new_task_path unless @task.save
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
        @task.update(name: params[:task][:name], type: params[:task][:type], status: params[:task][:status], deadline: params[:task][:deadline], notes: params[:task][:notes])
        redirect_to task_path(@task)
    end 

    def destroy
        @task = Task.find(params[:id]).destroy
    end 

    private

    def task_params
        params.require(:task).permit(:name, :schedule_name, :company_company_name, :type, :status, :deadline, :notes)
    end 
        
end
