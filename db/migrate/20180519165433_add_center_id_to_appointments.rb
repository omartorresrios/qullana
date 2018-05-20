class AddCenterIdToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :center_id, :integer
  end
end
