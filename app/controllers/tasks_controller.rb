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
        redirect_to task_path(@path)
    end 
end
