class AddDoctorIdNewToCenters < ActiveRecord::Migration[5.2]
  def change
    add_column :centers, :doctor_id, :integer
  end
end
