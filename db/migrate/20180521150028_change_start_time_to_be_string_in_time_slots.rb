class ChangeStartTimeToBeStringInTimeSlots < ActiveRecord::Migration[5.2]
  def change
  	change_column :time_slots, :start_time, :string
  end
end
