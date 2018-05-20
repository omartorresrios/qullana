class AddTimeSlotIdToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :time_slot_id, :integer
  end
end
