class DoctorsController < ApplicationController

  def all_doctors
  	doctors = Doctor.all
  	render json: doctors, status: 200
  end

  def main_action_dialogflow

  	action = params['queryResult']['action']

  	if action == "time_slot_of_doctor"

  	  parameter = params['queryResult']['parameters']['doctor_name']

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

  	elsif action == "department_available"
  	  
  	  parameter = params['queryResult']['parameters']['department_name']

  	  if department = Department.find_by(name: parameter)
  	  	render json: {
          fulfillmentText: "Está bien. ¿Con qué médico deseas la cita?"
        }.to_json
  	  else
  	  	render json: {
          fulfillmentText: "Lo sentimos, no tenemos #{parameter}."
        }.to_json
  	  end


  	end

    
  end

end