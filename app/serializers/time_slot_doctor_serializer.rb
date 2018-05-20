class TimeSlotDoctorSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :time_slots, serializer: TimeSlotSerializer

end