class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :label_name, null:false, unique: true
      t.string :color, null: false, default: "#ffffff"

      t.timestamps
    end
    add_index :labels, :label_name
  end
end
