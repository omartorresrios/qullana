class AddCenterIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :center_id, :integer
  end
end
