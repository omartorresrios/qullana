class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :center_id

  belongs_to :center
  has_many :doctors
  
end