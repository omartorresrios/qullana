class AddCenterIdToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :center_id, :integer
  end
end