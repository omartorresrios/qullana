class AddCenterIdToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :center_id, :integer
  end
end
