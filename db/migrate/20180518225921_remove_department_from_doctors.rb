class RemoveDepartmentFromDoctors < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :department, :string
  end
end
