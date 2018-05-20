class DoctorsController < ApplicationController

  def all_doctors
  	doctors = Doctor.all
  	render json: doctors, status: 200
  end

  def main_action_dialogflow

  	action = params['queryResult']['action']

  	if action == "time_slot_of_doctor"
  	  if doctor = Doctor.find_by(name: params['queryResult']['queryText'])#params["name"])
        time_slots = doctor.time_slots
        time_slot_array = []
        time_slots.each do |time_slot|
    	  if time_slot.is_filled == false
    	  	time_slot_array.push(time_slot.start_time)
    	    
    	  end
    	end

    	render json: {
      	  fulfillmentText: time_slot_array#.to_json#['availableTimeSlots']
    	}#.to_json
    	# render json: time_slots, status: 200
    	# parsed_json = ActiveSupport::JSON.decode(time_slots.to_json)
    	# puts parsed_json.to_json
      
      else 
        # render json: { errors: doctor.errors.full_messages }, status: 422
      end

  	# elsif action_name == "time_slot_of_doctor"
  			
  	end

    
  end

end