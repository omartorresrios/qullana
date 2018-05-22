class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :center_id, :department_id

  has_many :centers
  belongs_to :department
  has_many :appointments
  has_many :users, through: :appointments
  has_many :time_slots
end