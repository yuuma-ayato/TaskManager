class AddIndexToTasksContent < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, :content
  end
end
