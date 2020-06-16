class AddUniquenessToLabelName < ActiveRecord::Migration[5.2]
  def change
    remove_index :labels, :label_name
    add_index :labels, :label_name, unique: true
  end
end
