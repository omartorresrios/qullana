class AppointmentsController < ApplicationController

  def all_appointments
  	appointments = Appointment.all
  	render json: appointments, status: 200
  end

end