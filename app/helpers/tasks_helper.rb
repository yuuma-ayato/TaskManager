module TasksHelper

  def params_for_search
    search:params[:search],content:params[:content],status:params[:status],priority:params[:priority]
  end

  def priority_color(task)
    if task.priority == "高"
      "red"
    elsif task.priority == "中"
      "yellow"
    else
      "green"
    end
  end

  def status_color(task)
    if task.status == "完了"
      "complete"
    elsif task.status == "着手中"
      "working"
    else
      "waiting"
    end
  end
end
