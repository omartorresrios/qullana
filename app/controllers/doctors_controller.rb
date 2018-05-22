class DoctorsController < ApplicationController

  def all_doctors
  	doctors = Doctor.all
  	render json: doctors, status: 200
  end

  def main_action_dialogflow

  	action = params['queryResult']['action']

  	if action == "time_slot_of_doctor"

  	  parameter = params['queryResult']['parameters']['doctor_name']
  	  all_doctors = Doctor.all

  	  all_doctors_array = []

  	  all_doctors.each do |ad|
    	all_doctors_array.push(ad.name)
      end

  	  if doctor = Doctor.find_by(name: parameter)
        time_slots = doctor.time_slots

        time_slot_array = []

        time_slots.each do |time_slot|
    	  if time_slot.is_filled == false
    	  	time_slot_array.push(time_slot.start_time)
    	  end
    	end

    	render json: {
      	  fulfillmentText: "El Dr. #{doctor.name} tiene los siguientes horarios disponibles: " + time_slot_array.map(&:inspect).join(', ')
    	}.to_json.gsub('\"', '')
      
      else
      	render json: {
          fulfillmentText: "Lo sentimos, el Dr. #{parameter} no trabaja en este centro médico. Pero sí tenemos a los siguientes: " + + all_doctors_array.map(&:inspect).join(', ')
        }.to_json.gsub('\"', '')
      end

  	elsif action == "department_available"
  	  
  	  parameter = params['queryResult']['parameters']['department_name']
	  all_departments = Department.all

	  all_departments_array = []

      all_departments.each do |ad|
    	all_departments_array.push(ad.name)
      end

  	  if department = Department.find_by(name: parameter)
  	  	render json: {
          fulfillmentText: "Está bien. ¿Con qué médico deseas la cita?"
        }.to_json
  	  else
  	  	render json: {
          fulfillmentText: "Lo sentimos, no tenemos #{parameter}. Atendemos en estas especialidades: " + all_departments_array.map(&:inspect).join(', ')
        }.to_json.gsub('\"', '')
  	  end

  	elsif action == "show_doctor_centers"

  	  parameter = params['queryResult']['parameters']['doctor_name']
  	  if doctor = Doctor.find_by(name: parameter)
  	    centers = doctor.centers
  	    all_centers_array = []

	    centers.each do |c|
	      all_centers_array.push(c.name)
        end

  	    render json: {
          fulfillmentText: "El Dr. #{doctor.name} se encuentra en: " + all_centers_array.map(&:inspect).join(', ')
        }.to_json.gsub('\"', '')
      else
      	render json: {
          fulfillmentText: "Lo sentimos, no tenemos registrado al Dr. #{parameter}"
        }.to_json
	  end

	end
  end
end









