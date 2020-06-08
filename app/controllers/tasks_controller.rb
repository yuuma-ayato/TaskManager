class TasksController < ApplicationController
  before_action :set_task, only: %i(show edit update destroy)
  def index
    @tasks = Task.all.order(created_at: :DESC)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(get_task_params)
    if @task.save
      redirect_to tasks_path, notice:"新しいタスクを作成しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(get_task_params)
      redirect_to tasks_path, notice:"タスクを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"タスクを削除しました"
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def get_task_params
    params.require(:task).permit(:content,:detail)
  end
end
