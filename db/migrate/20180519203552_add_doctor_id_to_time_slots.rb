class AddDoctorIdToTimeSlots < ActiveRecord::Migration[5.2]
  def change
  	add_index :time_slots, :doctor_id
  end
end
