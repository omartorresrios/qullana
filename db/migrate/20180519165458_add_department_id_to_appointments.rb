class AddDepartmentIdToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :department_id, :integer
  end
end
