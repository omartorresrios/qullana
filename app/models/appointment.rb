class Appointment < ApplicationRecord

  belongs_to :user
  belongs_to :doctor
  belongs_to :center
  belongs_to :department
  belongs_to :time_slot

  validates :time_slot_id, presence: true
  validates :user_id, presence: true

end
