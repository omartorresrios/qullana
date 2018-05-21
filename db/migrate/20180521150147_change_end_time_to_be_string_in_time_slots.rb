class ChangeEndTimeToBeStringInTimeSlots < ActiveRecord::Migration[5.2]
  def change
  	change_column :time_slots, :end_time, :string
  end
end
