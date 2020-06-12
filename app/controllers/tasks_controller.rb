class TasksController < ApplicationController
  before_action :set_task, only: %i(show edit update destroy)

  def index
    #最初に検索済みかどうかで表示するタスクの一覧を絞る
    if params[:search].present?
      @task_searched = Task.what_content(params[:content]).what_status(params[:status])
    else
      @task_searched = Task.all
    end
    # 絞ったタスクをソートして返す
    case params[:sort]
      when "limit"
        @tasks = @task_searched.limit_desc
      else
        @tasks = @task_searched.order(created_at: :DESC)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(get_task_params)
    if @task.save
      redirect_to tasks_path
      flash[:notice] = "新しいタスクを作成しました"
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
    params.require(:task).permit(:content,:detail,:limit,:status)
  end


end
