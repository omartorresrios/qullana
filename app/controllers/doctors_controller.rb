class DoctorsController < ApplicationController

  def all_doctors
  	doctors = Doctor.all
  	render json: doctors, status: 200
  end

  def main_action_dialogflow

  	action = params['queryResult']['parameters']['doctor_name']

  	if action == "time_slot_of_doctor"

  	  parameter = params['queryResult']['queryText']

  	  if doctor = Doctor.find_by(name: parameter)
        time_slots = doctor.time_slots

        time_slot_array = []

        time_slots.each do |time_slot|
    	  if time_slot.is_filled == false
    	  	time_slot_array.push(time_slot.start_time)
    	  end
    	end

    	render json: {
      	  fulfillmentText: "El Dr. #{doctor.name} tiene los siguientes horarios disponibles: " + time_slot_array.map(&:inspect).join(', ')#.to_json#['availableTimeSlots']
    	}.to_json.gsub('\"', '')
      
      else
      	render json: {
          fulfillmentText: "El Dr. #{parameter} no labora en este centro médico. Lo sentimos."
        }.to_json
      end

  	elsif action_name == "department_available"
  	  
  	end

    
  end

end