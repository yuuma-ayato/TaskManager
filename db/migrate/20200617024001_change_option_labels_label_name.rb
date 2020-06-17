class ChangeOptionLabelsLabelName < ActiveRecord::Migration[5.2]
  def change
    change_column :labels, :label_name, :string, limit: 10
  end
end
