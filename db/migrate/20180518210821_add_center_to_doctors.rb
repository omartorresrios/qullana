class AddCenterToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :center, :string
  end
end
