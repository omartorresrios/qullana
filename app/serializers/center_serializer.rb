class CenterSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :users
  has_many :doctors
  has_many :departments
  
end