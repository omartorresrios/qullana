class CreateTimeSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :time_slots do |t|
      t.integer :doctor_id
      t.string :date
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration
      t.boolean :is_filled

      t.timestamps
    end
  end
end
