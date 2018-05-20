class TimeSlotSerializer < ActiveModel::Serializer
  attributes :available_time_slots

  def available_time_slots
  	if object.is_filled == false
  	  object.start_time
  	else

  	end
  end

end