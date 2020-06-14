class ChangeOptionStatusOnTask < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :content, :string, null: false, default: 0
  end
end
