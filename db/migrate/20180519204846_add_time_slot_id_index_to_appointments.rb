class AddTimeSlotIdIndexToAppointments < ActiveRecord::Migration[5.2]
  def change
  	add_index :appointments, :time_slot_id
  end
end
