class TasksController < ApplicationController
  before_action :set_task, only: %i(show)
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(get_task_params)
    @task.save
    redirect_to tasks_path
  end

  def show
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def get_task_params
    params.require(:task).permit(:content,:detail)
  end
end
