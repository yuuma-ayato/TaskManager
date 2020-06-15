class ChangeColumnOptionsTasksUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :user_id, :bigint, null: false
    change_column :users, :name, :string, limit: 20
    change_column :users, :email, :string, unique: true, limit: 255
  end
end
