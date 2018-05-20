class RemoveCenterFromDoctors < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :center, :string
  end
end
