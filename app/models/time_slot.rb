class TimeSlot < ApplicationRecord

	belongs_to :doctor
    # Each time slot can have at most one appointment
	has_one :appointment
	# Need to validate start time and end time
	#validates_format_of :date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "^Date must be in the following format: mm/dd/yyyy"
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :is_filled, inclusion: { in: [true, false]}

end
