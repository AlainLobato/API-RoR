class Api::V1::TaskzController < ApplicationController

  def index
    task = Task.all
    render json: task, status: 200
  end

  def show
    task = Task.find params[:id]

    if task
      render json: task, status: 200
    else
      render json: task.errors, status: :not_found
    end
  end

  def create
    task = Task.new task_params

    task.complete = false
    task.created_on = Time.now

    if task.save
      render json: task, status: :created
    else
      render json: task.errors, status: :unprocessable_entity 
    end
  end

  def update
    task = Task.find params[:id]

    if task
      task.update_attribute :finished_on, Time.now
      task.update_attribute :complete, true
      render json: task, status: 200
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    task = Task.find params[:id]

    if task
      task.destroy
      render json: task, status: 200
    else
      render json: task.errors, status: :unprocessable_entity
    end
  end

  private
  
  def task_params
    params.require(:tasking).permit :task, :user_id
  end

end
