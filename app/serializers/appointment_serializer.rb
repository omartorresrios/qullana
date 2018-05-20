class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :appointment_date, :user_id, :doctor_id

  belongs_to :user
  belongs_to :doctor
  belongs_to :center
  belongs_to :department
  belongs_to :time_slot
  
end