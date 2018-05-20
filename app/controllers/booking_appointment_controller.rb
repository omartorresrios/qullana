class BookingAppointmentController < ApplicationController

  # POST '/api/appointment/create'
  # BODY: {
  #   department: String,
  #   date: DateTime,
  # }
  
  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: appointment, serializer: AppointmentSerializer, status: 201
    else
      render json: { errors: appointment.errors.full_messages }, status: 422
    end
  end

  def available_timeslot_day
  	
  end

  private

    def appointment_params
      params.permit(:department_id, :center_id, :user_id, :doctor_id, :appointment_date)
    end

end