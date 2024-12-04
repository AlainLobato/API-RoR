class Api::V1::TasksController < ApplicationController

  def index
    task = Task.all
    render json: task, status: 200
  end

  def show
    task = Task.find params[:id]
    render json: task
  end

  def create
    task = Task.create task_params

    if task.save
      render json: task, status: :created
    else
      render json: task.errors, status: :unprocessable_entity 
    end
  end

  def update
    
  end

  def destroy
    
  end

  private
  
  def task_params
    params.require(:task).permit :task, :complete, :created_on, :finished_on
  end

end
