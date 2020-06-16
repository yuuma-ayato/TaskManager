class AddColumnAdminToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :admin, :boolean, default: false
  end
end
