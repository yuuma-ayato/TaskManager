class ChangeColumnDetailOption < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :detail, :text, limit: 255
  end
end
