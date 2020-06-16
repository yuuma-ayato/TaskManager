class AddNullFalseToUsersName < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :string, null:false, limit: 20
  end
end
