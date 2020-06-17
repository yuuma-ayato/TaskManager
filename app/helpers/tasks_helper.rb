module TasksHelper

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

  def select_label(label)
    true if @task.labels.include?(label)
  end
end
