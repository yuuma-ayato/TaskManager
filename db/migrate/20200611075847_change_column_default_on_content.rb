class ChangeColumnDefaultOnContent < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tasks, :content, nil
  end
end
