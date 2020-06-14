class TasksController < ApplicationController
  before_action :set_task, only: %i(show edit update destroy)
  PER = 12

  def index
    set_tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(get_task_params)
    set_tasks
    respond_to do |format|
      if @task.save
        flash.now[:notice] = "新しいタスクを作成しました"
        format.js { render :index }
      else
        format.js { render :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    set_tasks
    respond_to do |format|
      if @task.update(get_task_params)
        flash.now[:notice] = "タスクを編集しました"
        format.js { render :index }
      else
        format.js { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    set_tasks
    respond_to do |format|
      flash.now[:notice] = "タスクを削除しました"
      format.js { render :index }
    end
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def get_task_params
    params.require(:task).permit(:content,:detail,:limit,:status,:priority)
  end

  def set_tasks
    # 最初に検索済みかどうかで対象のタスクを絞る
    if params[:search].present?
      @task_searched = Task.what_content(params[:content]).what_status(params[:status]).what_priority(params[:priority])
    else
      @task_searched = Task.all
    end
    # 絞ったタスクをソートして返す
    if params[:sort]
      @tasks = @task_searched.limit_desc(params[:sort]).status_asc(params[:sort]).priority_desc(params[:sort]).page(params[:page]).per(PER)
    else
      @tasks = @task_searched.order(created_at: :DESC).page(params[:page]).per(PER)
    end
  end


end
