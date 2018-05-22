class RemoveDoctorIdNewFromCenters < ActiveRecord::Migration[5.2]
  def change
    remove_column :centers, :doctor_id, :integer
  end
end
