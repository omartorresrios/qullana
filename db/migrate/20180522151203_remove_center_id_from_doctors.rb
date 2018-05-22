class RemoveCenterIdFromDoctors < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :center_id, :integer
  end
end
